
import 'package:communiqo/src/common/styles.dart';
import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/data/bloc/chat_bloc.dart';
import 'package:communiqo/src/model/message.dart';
import 'package:communiqo/src/model/user_model.dart';
import 'package:communiqo/src/ui/chat_screen/chat_screen.dart';
import 'package:communiqo/src/ui/profile/profile_screen.dart';
import 'package:communiqo/src/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final chatBloc = ChatBloc();
  String groupValue ="Inbox";

  @override
  void initState() {
    // TODO: implement initState
    chatBloc.eventSink.add(CounterAction.Fetch);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.of(context)!.current!.baseColor,
        body: Container(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Row(
                children: [
                  // avatar
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProfileScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Avatar(url: currentUser.imgUrl, width: 45.0, height: 45.0),
                        SizedBox(width: 10.0),
                        // name
                        Text("Chats",
                            style: TextStyle(
                                color: NeumorphicTheme.defaultTextColor(context),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(onTap: (){
                    chatBloc.eventSink.add(CounterAction.Increment);
                  },
                    child: Neumorphic(
                      style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),shape: NeumorphicShape.flat,depth: 2,intensity: .8),
                      child: Container(
                        width: 45,height: 45,
                          padding: EdgeInsets.all(11.0),
                          child: Center(
                            child: SvgPicture.asset(Assets.search,),
                          )),
                    ),
                  )
                ],
              ),
            ),
            // search box
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 10.0),
            //     decoration: BoxDecoration(
            //         color: background,
            //         boxShadow: softShadowsInvert,
            //         borderRadius: BorderRadius.circular(30.0)),
            //     child: Row(
            //       children: <Widget>[
            //         Container(
            //             padding: EdgeInsets.all(6.0),
            //             decoration: BoxDecoration(
            //                 boxShadow: softShadows,
            //                 color: background,
            //                 shape: BoxShape.circle),
            //             child: Icon(
            //               Icons.search,
            //               size: 16.0,
            //               color: Theme.of(context).primaryColor,
            //             )),
            //         SizedBox(width: 12.0),
            //         Expanded(
            //           child: TextField(
            //             style: TextStyle(color: textColor, fontSize: 16.0),
            //             decoration: InputDecoration(
            //                 hintText: 'Search...',
            //                 hintStyle:
            //                     TextStyle(color: textColor.withOpacity(0.6)),
            //                 filled: false,
            //                 border: InputBorder.none,
            //                 isDense: true,
            //                 contentPadding: EdgeInsets.symmetric(
            //                     horizontal: 4.0, vertical: 12.0)),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // List User
            // Container(
            //   height: 100.0,
            //   child: Center(
            //     child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: favoriteUsers.length,
            //         itemBuilder: (BuildContext ctx, int index) =>
            //             buildUserAvatar(favoriteUsers[index])),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Neumorphic(style: NeumorphicStyle(depth: 1,intensity: 5),
                      child: Container(
                      child: _buildWidget(context))),
                ],
              ),
            ),
            // recent
            Expanded(
                child:  Padding(
                  padding: const EdgeInsets.only(top:12.0,left:12,right: 12),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              itemCount: recentChats.length,
              itemBuilder: (BuildContext ctx, int index) =>
                    buildRecentChat(recentChats[index], context),
            ),))
          ],
        ),
      ),
    ));
  }

  Widget buildUserAvatar(User user) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 6.0),
      child: Column(
        children: <Widget>[
          Avatar(
            url: user.imgUrl,
            isOnline: user.isOnline,
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
            width: 64.0,
            child: Text(
              "Chats",
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: textColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRecentChat(Message message, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              sender: message.sender,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Avatar(width: 65,height: 65,
              url: message.sender.imgUrl,
              isOnline: message.sender.isOnline,
            ),
            SizedBox(width: 14.0),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.sender.name,
                      style: TextStyle(
                          color: NeumorphicTheme.defaultTextColor(context),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 3.0),
                    Text(message.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: message.hasRead
                                ?  NeumorphicTheme.defaultTextColor(context).withOpacity(.4)
                                :  NeumorphicTheme.defaultTextColor(context),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400))
                  ],
                )),
            SizedBox(width: 8.0),
            Column(
              children: [
                Text(
                  formatTime('0' + message.time.hour.toString()) +
                      ':' +
                      formatTime('0' + message.time.minute.toString()),
                  style:
                  TextStyle(color: NeumorphicTheme.accentColor(context), fontSize: 12.0),
                ),
                SizedBox(height: 3,),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),color: NeumorphicTheme.accentColor(context),),
                    padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 6),
                    child: StreamBuilder<Object>(
                        stream: chatBloc.chatStream,
                        builder: (context, snapshot) {
                          if(snapshot.hasData)
                            return Text(snapshot.data.toString(),style: TextStyle(color:Colors.white ,fontSize: 9),);
                          else
                            return Container();
                        }
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Row(
        children: <Widget>[
          NeumorphicRadio(
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(6))),
                unselectedDepth: 0,
                selectedDepth: -3,
                unselectedColor: Colors.transparent),
            groupValue: groupValue,
            value: "Inbox",
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Text("Inbox",style:groupValue== "Inbox"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(color: Colors.grey, width: .4,height:14,),
          ),
          NeumorphicRadio(
            value: "Archive",
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(6))),
                unselectedDepth: 0,
                selectedDepth: -3,
                unselectedColor: Colors.transparent),
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Text("Archive",style:groupValue== "Archive"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(color: Colors.grey, width: .4,height:14,),
          ),
          NeumorphicRadio(
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(6))),
                unselectedDepth: 0,
                selectedDepth: -3,
                unselectedColor: Colors.transparent),
            groupValue: groupValue,
            value: "Trash",
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Text("Trash",style:groupValue== "Trash"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
          ),
        ],
      ),
    );
  }

  String formatTime(String time) {
    return time.substring(time.length - 2);
  }
}
