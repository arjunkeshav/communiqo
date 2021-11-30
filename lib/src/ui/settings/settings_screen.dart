
import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/ui/settings/display/display_settings.dart';
import 'package:communiqo/src/ui/settings/messages/messages_settings_screen.dart';
import 'package:communiqo/src/ui/settings/notification/notification_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  buildTiles({required BuildContext context, required String icon, required String name}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Neumorphic(
              style: NeumorphicStyle(
                  depth: 3, intensity: .9, shape: NeumorphicShape.concave),
              child: Container(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
                color: NeumorphicTheme.of(context)!.current!.baseColor,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    Container(
                        width: 16,
                        height: 30,
                        child: SvgPicture.asset(
                          icon,
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: NeumorphicTheme.currentTheme(context)
                              .defaultTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
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
  void dispose() {
    // TODO: implement dispose
    if(_controller!=null)
      _controller!.clear();
    super.dispose();
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

              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, bottom: 10.0, top: 16),
              child: Row(
                children: [
                  SizedBox(width: 15.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                              color: NeumorphicTheme.currentTheme(context)
                                  .defaultTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
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
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DisplaySetting()),
                      );
                    },
                    child: buildTiles(
                        context: context, icon: Assets.admin, name: "Display"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MessageSettings()),
                      );
                    },
                    child: buildTiles(
                        context: context,
                        icon: Assets.messages,
                        name: "Messages"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => NotificationSettings()),
                      );
                    },
                    child: buildTiles(
                        context: context,
                        icon: Assets.notification,
                        name: "Notification"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => AdminSettings()),
                      // );
                    },
                    child: buildTiles(
                        context: context,
                        icon: Assets.miscellaneous,
                        name: "Miscellaneous"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
