
import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/model/message.dart';
import 'package:communiqo/src/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {



  buildNotes(Message message, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
              child: Align(
                alignment:Alignment.center,
                child: Neumorphic(
                  style: NeumorphicStyle(depth: 3,intensity: .9,shape: NeumorphicShape.flat),
                  child: Container(
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.8,
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    color:Color(0xFFF2F0B4),
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(width: 12,height: 12,
                                child: SvgPicture.asset(Assets.admin,color: Color(0xFF575F6B),)
                            ),
                            SizedBox(width: 6,),
                            Text(
                              "Admin",
                              style: TextStyle(color:NeumorphicTheme.currentTheme(context).defaultTextColor,fontSize: 14,fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(height: 2,),

                        Text(
                          message.content,
                          style: TextStyle(color:NeumorphicTheme.currentTheme(context).defaultTextColor.withOpacity(.9)),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
  TextEditingController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: SafeArea(
            child: Column(
              children: [
                // nav
                Container(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 10.0),
                  child: Row(
                    children: [
                      ButtonIcon(
                        iconPath: Assets.arrowBack,
                        action: () => Navigator.pop(context),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Notes",
                              style: TextStyle(
                                  color: NeumorphicTheme.currentTheme(context).defaultTextColor, fontWeight: FontWeight.bold,fontSize: 18),
                            ),
                            // Text(sender.isOnline ? 'Online' : 'Offline',
                            //     style: TextStyle(
                            //       color: textColor.withOpacity(.54),
                            //       fontSize: 14.0,
                            //     ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      itemCount: messages.length,
                      reverse: false,
                      itemBuilder: (BuildContext context, index) =>
                          buildNotes(messages[index], context)),
                ),

              ],
            ),
          ),
        ));
  }
}
