
import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AdminSettings extends StatefulWidget {
  @override
  _AdminSettingsState createState() => _AdminSettingsState();
}

class _AdminSettingsState extends State<AdminSettings> {

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
                              "Admin",
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
                            Text("Admin Title",style: TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor,fontSize: 16,fontWeight: FontWeight.w700),),
                            SizedBox(height: 5,),
                            Text("Set the title of the administration area.",style: TextStyle(color: NeumorphicTheme.currentTheme(context).defaultTextColor,fontSize: 12,fontWeight: FontWeight.w300),),
                            SizedBox(height: 10,),
                            Neumorphic(
                              margin: EdgeInsets.only(left: 0, right: 8, top: 2, bottom: 4),
                              style: NeumorphicStyle(
                                depth:-3,intensity: .77,shadowLightColorEmboss: Colors.white,shadowDarkColorEmboss: Colors.black38,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(8))),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                              child: TextFormField(

                                controller: _controller,
                                decoration: InputDecoration.collapsed(hintText: "Name",hintStyle: TextStyle(color: NeumorphicTheme.currentTheme(context).defaultTextColor.withOpacity(.31),fontWeight: FontWeight.w700)),
                              ),
                            ),
                            SizedBox(height: 3,),
                            Divider(),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Disable Notes",style: TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor,fontSize: 16,fontWeight: FontWeight.w700),),
                                    SizedBox(height: 5,),
                                    Text("Disable the internal notes",style: TextStyle(color: NeumorphicTheme.currentTheme(context).defaultTextColor,fontSize: 12,fontWeight: FontWeight.w300),),

                                  ],
                                ),
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
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Disable Attachments",style: TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor,fontSize: 16,fontWeight: FontWeight.w700),),
                                    SizedBox(height: 5,),
                                    Text("Disable the attachment list",style: TextStyle(color: NeumorphicTheme.currentTheme(context).defaultTextColor,fontSize: 12,fontWeight: FontWeight.w300),),

                                  ],
                                ),
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
                            SizedBox(height: 10,),
                            Text("Transcript type",style: TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor,fontSize: 16,fontWeight: FontWeight.w700),),
                            SizedBox(height: 5,),
                            Text("Set the default transcript file type",style: TextStyle(color: NeumorphicTheme.currentTheme(context).defaultTextColor,fontSize: 12,fontWeight: FontWeight.w300),),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Neumorphic(
                                        style: NeumorphicStyle(
                                            depth: 3, intensity: .9, shape: NeumorphicShape.concave),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              minWidth: MediaQuery.of(context).size.width,
                                              maxWidth: MediaQuery.of(context).size.width),
                                          color: Color(0xFFE5E6EC),
                                          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "CSV",
                                                style: TextStyle(
                                                    color: NeumorphicTheme.currentTheme(context)
                                                        .defaultTextColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              SvgPicture.asset(Assets.downArrow,color: NeumorphicTheme.currentTheme(context).defaultTextColor),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            )


                          ],
                        )))


              ],
            ),
          ),
        ));
  }
}
