
import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/model/message.dart';
import 'package:communiqo/src/model/user_model.dart';
import 'package:communiqo/src/ui/chat_screen/notes/notes_screen.dart';
import 'package:communiqo/src/widgets/avatar.dart';
import 'package:communiqo/src/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  final User sender;

  const ChatScreen({Key? key, required this.sender}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showSavedNotes = false;
  bool showForward = false;

  buildChat(Message message, BuildContext context) {
    final bool isCurrentUser = message.sender.id == currentUser.id;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 4.0),
              Expanded(
                  child: Align(
                alignment:
                    isCurrentUser ? Alignment.topLeft : Alignment.topRight,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      depth: 3, intensity: .9, shape: NeumorphicShape.flat),
                  child: Container(
                    constraints: BoxConstraints(
                        minWidth: 50,
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    color: isCurrentUser
                        ? NeumorphicTheme.currentTheme(context).baseColor
                        : Color(0xFF3DADD1),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    child: Text(
                      message.content,
                      style: TextStyle(
                          color: isCurrentUser
                              ? NeumorphicTheme.currentTheme(context)
                                  .defaultTextColor
                              : Colors.white),
                    ),
                  ),
                ),
              ))
            ],
          ),
          Align(
            alignment: isCurrentUser ? Alignment.topLeft : Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8, right: 8),
              child: Text(
                "9:14 AM",
                style: TextStyle(
                    color:
                        NeumorphicTheme.currentTheme(context).defaultTextColor,
                    fontSize: 9.0),
              ),
            ),
          )
        ],
      ),
    );
  }

   TextEditingController? _controller;
  late String groupValue;


  @override
  void initState() {
    groupValue = "General";
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
            // nav
            Container(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 10.0),
              child: Row(
                children: [
                  ButtonIcon(
                    iconPath: Assets.arrowBack,
                    action: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 16.0),
                  Avatar(
                    url: widget.sender.imgUrl,
                    width: 50.0,
                    height: 50.0,
                    isOnline: widget.sender.isOnline,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.sender.name,
                          style: TextStyle(
                              color: NeumorphicTheme.currentTheme(context)
                                  .defaultTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        // Text(sender.isOnline ? 'Online' : 'Offline',
                        //     style: TextStyle(
                        //       color: textColor.withOpacity(.54),
                        //       fontSize: 14.0,
                        //     ))
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ButtonIcon(
                    iconPath: Assets.endConversation, action: () {  },
                  ),
                  SizedBox(width: 10.0),
                  ButtonIcon(
                    iconPath: Assets.forward,
                    clicked: showForward,
                    action: (){
                      setState(() {
                        if(!showSavedNotes)
                        showForward = !showForward;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      itemCount: messages.length,
                      reverse: true,
                      itemBuilder: (BuildContext context, index) =>
                          buildChat(messages[index], context)),
                  showSavedNotes || showForward
                      ? Positioned(
                          child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showSavedNotes = false;
                              showForward = false;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black12.withOpacity(.05),
                          ),
                        ))
                      : SizedBox(),
                  showSavedNotes
                      ? Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                depth: 2,
                                intensity: .6,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.only(
                                        topRight: Radius.circular(22),
                                        topLeft: Radius.circular(22)))),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .5,
                              width: MediaQuery.of(context).size.width,
                              color: NeumorphicTheme.currentTheme(context)
                                  .baseColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Container(
                                          height: 60,
                                          child: Center(
                                              child: Text(
                                            "SAVED REPLIES",
                                            style: TextStyle(
                                                color: NeumorphicTheme
                                                        .currentTheme(context)
                                                    .defaultTextColor,
                                                fontWeight: FontWeight.w700),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: ListView(
                                    padding: EdgeInsets.only(left: 30),
                                    children: [
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text("#omg  Oh My God",
                                          style: TextStyle(
                                              color:
                                                  NeumorphicTheme.currentTheme(
                                                          context)
                                                      .defaultTextColor)),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text("#hru  How Are You",
                                          style: TextStyle(
                                              color:
                                                  NeumorphicTheme.currentTheme(
                                                          context)
                                                      .defaultTextColor)),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text("#omg  Oh My God",
                                          style: TextStyle(
                                              color:
                                                  NeumorphicTheme.currentTheme(
                                                          context)
                                                      .defaultTextColor)),
                                      SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ))
                      : SizedBox(),
                  showForward
                      ? Positioned(
                          left: MediaQuery.of(context).size.width*.4,
                          right: 8,
                          top: 10,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                depth: 1,
                                intensity: .6,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.all(Radius.circular(22)))),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width*.4,
                              color: NeumorphicTheme.currentTheme(context)
                                  .baseColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 25),
                                        child: Container(
                                          height: 60,
                                          child: Center(
                                              child: Text(
                                            "DEPARTMENTS",
                                            style: TextStyle(
                                                color: NeumorphicTheme
                                                        .currentTheme(context)
                                                    .defaultTextColor,
                                                fontWeight: FontWeight.w700),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: ListView(
                                    padding: EdgeInsets.only(left: 05,right: 20),
                                    children: [
                                      NeumorphicRadio(
                                        style: NeumorphicRadioStyle(
                                            boxShape: NeumorphicBoxShape.roundRect(
                                                BorderRadius.all(Radius.circular(6))),
                                            unselectedDepth: 0,
                                            selectedDepth: -3,
                                            unselectedColor: Colors.transparent),
                                        groupValue: groupValue,
                                        value: "General",
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value.toString();
                                          });
                                        },
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        child: Text("General",style:groupValue== "General"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
                                      ),
                                      SizedBox(height: 8,),
                                      NeumorphicRadio(
                                        style: NeumorphicRadioStyle(
                                            boxShape: NeumorphicBoxShape.roundRect(
                                                BorderRadius.all(Radius.circular(6))),
                                            unselectedDepth: 0,
                                            selectedDepth: -3,
                                            unselectedColor: Colors.transparent),
                                        groupValue: groupValue,
                                        value: "D1",
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value.toString();
                                          });
                                        },
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        child: Text("D1",style:groupValue== "D1"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
                                      ),
                                      SizedBox(height: 8,),
                                      NeumorphicRadio(
                                        style: NeumorphicRadioStyle(
                                            boxShape: NeumorphicBoxShape.roundRect(
                                                BorderRadius.all(Radius.circular(6))),
                                            unselectedDepth: 0,
                                            selectedDepth: -3,
                                            unselectedColor: Colors.transparent),
                                        groupValue: groupValue,
                                        value: "D2",
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value.toString();
                                          });
                                        },
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        child: Text("D2",style:groupValue== "D2"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
                                      ),
                                      SizedBox(height: 8,),
                                      NeumorphicRadio(
                                        style: NeumorphicRadioStyle(
                                            boxShape: NeumorphicBoxShape.roundRect(
                                                BorderRadius.all(Radius.circular(6))),
                                            unselectedDepth: 0,
                                            selectedDepth: -3,
                                            unselectedColor: Colors.transparent),
                                        groupValue: groupValue,
                                        value: "D3",
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value.toString();
                                          });
                                        },
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        child: Text("D3",style:groupValue== "D3"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
                                      ),
                                      SizedBox(height: 8,),


                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ))
                      : SizedBox(),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          depth: 1,
                          lightSource: LightSource.bottom,
                          shape: NeumorphicShape.concave,
                          surfaceIntensity: 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10.0),
                        child: SafeArea(
                          child: Row(
                            children: [
                              ButtonIcon(
                                iconPath: Assets.attachment, action: () {  },
                              ),
                              SizedBox(width: 10.0),
                              ButtonIcon(
                                iconPath: Assets.savedChats,
                                clicked: showSavedNotes,
                                action: () {
                                  setState(() {
                                    if(!showForward)
                                    showSavedNotes = !showSavedNotes;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Stack(
                                  children: [
                                    Neumorphic(
                                      margin: EdgeInsets.only(
                                          left: 8, right: 8, top: 2, bottom: 4),
                                      style: NeumorphicStyle(
                                          depth: NeumorphicTheme.embossDepth(
                                              context),
                                          boxShape:
                                              NeumorphicBoxShape.stadium()),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 18),
                                      child: TextFormField(
                                        controller: _controller,
                                        decoration: InputDecoration.collapsed(
                                            hintText: "Message...",
                                            hintStyle: TextStyle(
                                                color: NeumorphicTheme
                                                        .currentTheme(context)
                                                    .defaultTextColor
                                                    .withOpacity(.81),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13)),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Neumorphic(
                                        style: NeumorphicStyle(
                                            depth: 2,
                                            intensity: .7,
                                            boxShape:
                                                NeumorphicBoxShape.circle(),
                                            shape: NeumorphicShape.flat),
                                        child: Container(
                                            height: 35,
                                            width: 35,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(11.0),
                                              child: SvgPicture.asset(
                                                  Assets.sendMessage),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.0),
                              ButtonIcon(
                                iconPath: Assets.notes,
                                action: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NotesScreen()),
                                ),
                                borderRadius: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
