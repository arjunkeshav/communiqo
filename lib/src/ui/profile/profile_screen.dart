

import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/ui/profile/edit_profile_screen.dart';
import 'package:communiqo/src/widgets/avatar.dart';
import 'package:communiqo/src/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool check1 = false;
  String groupValue ="";
  TextEditingController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NeumorphicTheme.of(context)!.current!.baseColor,
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
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
                                "Profile",
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
                        Expanded(
                          child: Container(),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => EditProfileScreen()),
                            );
                          },
                          child: Neumorphic(
                            style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),shape: NeumorphicShape.flat,depth: 2,intensity: .8),
                            child: Container(
                                width: 45,height: 45,
                                padding: EdgeInsets.all(11.0),
                                child: Center(
                                  child: SvgPicture.asset(Assets.updateProfile,color: NeumorphicTheme.currentTheme(context).accentColor,),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.06,),
                  Align(
                    alignment: Alignment.center,
                    child: Avatar(
                    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWHjMzM5qzBjS64SJEIyCQkLgXODzDLznFPOt54tmyPNXP3BQ78_AN83FAlbeGujmuPCg&usqp=CAU",
                    width: 120.0,
                    height: 120.0,
                    isOnline: false,
                    circleShape: false,
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                    "Name",
                    style: TextStyle(
                        color: NeumorphicTheme.currentTheme(context)
                            .defaultTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height*.005,),
                  Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width*.035,
                          height: 25,
                          child: SvgPicture.asset(
                            Assets.phoneIcon,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "9786765646",
                        style: TextStyle(
                            color: NeumorphicTheme.currentTheme(context)
                                .defaultTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),


                  buildTiles(
                      context: context, icon: Assets.admin, name: "Admin"),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:22.0),
                    child: _buildWidget(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: List.generate(5, (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal:6.0,vertical: 6),
                        child: buildDocs(context: context),
                      ),)
                    ),
                  ),





                ],
              ),
            ),
          ),
        ));
  }
  buildTiles({required BuildContext context, required String icon, required String name}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: Neumorphic(
          style: NeumorphicStyle(
              depth: 3, intensity: .6, shape: NeumorphicShape.concave),
          child: Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.9,
                maxWidth: MediaQuery.of(context).size.width * 0.9),
            height: MediaQuery.of(context).size.height*.38,
            color: Color(0xFFE5E6EC),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*.05,
                        height: 30,
                        child: SvgPicture.asset(
                          Assets.detailsIcon,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      child: Center(
                        child: Text(
                          "Details",
                          style: TextStyle(
                              color: NeumorphicTheme.currentTheme(context)
                                  .defaultTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                buildRow(context: context,icon: Assets.lockIcon,detailName: "ID",detailBody: "3"),
                Divider(thickness: .8,),
                buildRow(context: context,icon: Assets.lockIcon,detailName: "CREATION TIME",detailBody: "01:42 PM"),
                Divider(thickness: .8,),
                buildRow(context: context,icon: Assets.lockIcon,detailName: "LAST ACTIVITY",detailBody: "01:42 PM"),
                Divider(thickness: .8,),
                buildRow(context: context,icon: Assets.lockIcon,detailName: "TOKEN",detailBody: "xdDKFHVFVfvcvdnddsScjdsd"),
                Divider(thickness: .8,),
                buildRow(context: context,icon: Assets.lockIcon,detailName: "WHATSAPP",detailBody: "91790287654@c.us"),

              ],
            ),
          ),
        ),
      ),
    );
  }
  buildDocs({required BuildContext context}) {
    return Column(
      children: [
        Neumorphic(
          style: NeumorphicStyle(
              depth: 2, intensity: .8, shape: NeumorphicShape.concave),
          child: Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width*.2,
                maxWidth: MediaQuery.of(context).size.width*.2),
            height: MediaQuery.of(context).size.width*.2,
            color: Color(0xFFE5E6EC),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width*.1,
                  height: MediaQuery.of(context).size.width*.1,
                  child: SvgPicture.asset(
                    Assets.docsIcon,
                  )),
            ),
          ),
        ),
        SizedBox(height: 4,),
        Text(
          "dwg.doc",
          style: TextStyle(
              color: NeumorphicTheme.currentTheme(context)
                  .defaultTextColor,
              fontSize: 10,
              fontWeight: FontWeight.w400),textAlign: TextAlign.start,
        )
      ],
    );
  }

  Row buildRow({required BuildContext context,required String icon,required String detailName,required String detailBody}) {
   print(MediaQuery.of(context).size.width*.06);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.of(context).size.width*.05,
           height: MediaQuery.of(context).size.width*.05,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width*.04,
                height: MediaQuery.of(context).size.width*.04,
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                  ),
                ),
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.width*.06,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                detailName,
                style: TextStyle(
                    color: NeumorphicTheme.currentTheme(context)
                        .defaultTextColor.withOpacity(.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width*.06,

          child: Center(
            child: Text(
              " : ",
              style: TextStyle(
                  color: NeumorphicTheme.currentTheme(context)
                      .defaultTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            height: MediaQuery.of(context).size.width*.06,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                detailBody,
                style: TextStyle(
                    color: NeumorphicTheme.currentTheme(context)
                        .defaultTextColor.withOpacity(.9),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: NeumorphicRadio(
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.only(bottomLeft: Radius.circular(33),topLeft: Radius.circular(33))),
                unselectedDepth: 1,
                selectedDepth: -3,
                unselectedColor: Colors.transparent),
            groupValue: groupValue,
            value: "Images",
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*.02,
                    height: 20,
                    child: SvgPicture.asset(
                      Assets.imageIcon,color: groupValue== "Images"?NeumorphicTheme.currentTheme(context).accentColor:null,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text("Images",style:groupValue== "Images"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: NeumorphicRadio(
            value: "Audio",
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(1))),
                unselectedDepth: 1,
                selectedDepth: -3,
                unselectedColor: Colors.transparent),
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*.02,
                    height: 20,
                    child: SvgPicture.asset(
                      Assets.audioIcon,color: groupValue== "Audio"?NeumorphicTheme.currentTheme(context).accentColor:null,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text("Audio",style:groupValue== "Audio"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: NeumorphicRadio(
            value: "Video",
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(1))),
                unselectedDepth: 1,
                selectedDepth: -3,
                unselectedColor: Colors.transparent),
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*.02,
                    height: 20,
                    child: SvgPicture.asset(
                      Assets.videoIcon,color: groupValue== "Video"?NeumorphicTheme.currentTheme(context).accentColor:null,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text("Video",style:groupValue== "Video"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,

          child: NeumorphicRadio(
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.only(bottomRight:Radius.circular(33),topRight:Radius.circular(33) )),
                unselectedDepth: 1,
                selectedDepth: -3,
                unselectedColor: Colors.transparent),
            groupValue: groupValue,
            value: "Docs",
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*.02,
                    height: 20,
                    child: SvgPicture.asset(
                      Assets.docsIcon,color: groupValue== "Docs"?NeumorphicTheme.currentTheme(context).accentColor:null,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text("Docs",style:groupValue== "Docs"?TextStyle(color: NeumorphicTheme.currentTheme(context).accentColor):TextStyle()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
