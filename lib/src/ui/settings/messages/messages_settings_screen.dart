

import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MessageSettings extends StatefulWidget {
  @override
  _MessageSettingsState createState() => _MessageSettingsState();
}

class _MessageSettingsState extends State<MessageSettings> {
  bool check1 = false;
  TextEditingController? _controller;
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
                              "Messages",
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
                SizedBox(height: MediaQuery.of(context).size.height*.06,),
                Align(alignment: Alignment.centerLeft,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Close message",style: TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor,fontSize: 16,fontWeight: FontWeight.w700),),
                            SizedBox(height: 5,),
                            Text("Send a message to the user when the agent archive the conversation.",style: TextStyle(color: NeumorphicTheme.currentTheme(context).defaultTextColor,fontSize: 12,fontWeight: FontWeight.w300),),


                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text("Active",style: TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor,fontSize: 16,fontWeight: FontWeight.w700),),
                                NeumorphicCheckbox(
                                  style: NeumorphicCheckboxStyle(unselectedDepth: 2,selectedDepth: -2),
                                  value: check1,
                                  onChanged: (value) {
                                    setState(() {
                                      check1 = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider(),

                            Text("Message",style: TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor,fontSize: 16,fontWeight: FontWeight.w700),),
                            SizedBox(height: 5,),
                            Neumorphic(
                              margin: EdgeInsets.only(left: 0, right: 8, top: 2, bottom: 4),
                              style: NeumorphicStyle(
                                depth:-3,intensity: .77,shadowLightColorEmboss: Colors.white,shadowDarkColorEmboss: Colors.black38,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(8))),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                              child: TextFormField(
                                minLines: 9,
                                maxLines: 10,

                                controller: _controller,
                                decoration: InputDecoration.collapsed(hintText: "message",hintStyle: TextStyle(color: NeumorphicTheme.currentTheme(context).defaultTextColor.withOpacity(.31),fontWeight: FontWeight.w700)),
                              ),
                            ),



                          ],
                        )))


              ],
            ),
          ),
        ));
  }
}
