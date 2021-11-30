

import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DisplaySetting extends StatefulWidget {

  @override
  _DisplaySettingState createState() => _DisplaySettingState();
}

class _DisplaySettingState extends State<DisplaySetting> {
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
                              "Display",
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
                            buildTitleOnly(context: context,title: "DarkTheme",isCheckBoxEnabled: true)



                          ],
                        )))


              ],
            ),
          ),
        ));
  }
  Widget buildTitleOnly(
      {required BuildContext context, required String title, required bool isCheckBoxEnabled}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Flexible(
          flex: 3,
          child: Text(
            title,
            style: TextStyle(
                color: NeumorphicTheme.currentTheme(context).accentColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        isCheckBoxEnabled
            ? Flexible(
          flex: 1,
          child: NeumorphicCheckbox(
            style: NeumorphicCheckboxStyle(
                unselectedDepth: 2, selectedDepth: -2),
            value: check1,
            onChanged: (value) {
              NeumorphicTheme.of(context)!.themeMode =
              NeumorphicTheme.isUsingDark(context)
                  ? ThemeMode.light
                  : ThemeMode.dark;
              setState(() {
                check1 = value;
              });
            },
          ),
        )
            : SizedBox(),
      ],
    );
  }
}
