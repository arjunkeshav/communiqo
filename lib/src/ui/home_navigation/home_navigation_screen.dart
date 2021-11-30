import 'dart:async';
import 'dart:io';


import 'package:communiqo/src/ui/dashboard/dashboard.dart';
import 'package:communiqo/src/ui/settings/settings_screen.dart';
import 'package:communiqo/src/ui/users_chat/users_chats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeNavigation extends StatefulWidget {
  final int index;

  HomeNavigation({required this.index});

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation>
    with WidgetsBindingObserver {
  int _selectedIndex = 0;
  final snackBar = SnackBar(
    content: Text('Tap back again to leave !'),
    backgroundColor: Color(0xFF00AAE2),
    duration: Duration(seconds: 3),
  );
  final List<Widget> _children = [
    DashBoard(),
    DashBoard(),
    UsersChats(),
    SettingsScreen(),

  ];

  // final List<Widget> _children = [ObjectFactory().prefs.getLayoutId()=="1"? HomeScreen():Explore(),FilterCategoryScreen(),NotificationScreen(),ProfileScreen()];


  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String groupValue="A";

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null) {
      if (now.difference(currentBackPressTime!) > Duration(seconds: 3)) {
        currentBackPressTime = now;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return Future.value(false);
      }
    }
    exit(0);
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22,vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          NeumorphicRadio(
            style: NeumorphicRadioStyle(
              boxShape: NeumorphicBoxShape.circle(),unselectedDepth: 2,selectedDepth: 2,intensity: 1,
              shape: NeumorphicShape.concave
            ),
            groupValue: groupValue,
            value: "A",
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
                _selectedIndex = 0;
              });
            },
            padding: EdgeInsets.all(13.0),
            child: SvgPicture.asset("assets/icons/chat.svg",color:groupValue=="A"? NeumorphicTheme.currentTheme(context).accentColor:Color(0xFF919191)),
          ),

          NeumorphicRadio(
            value: "B",
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),unselectedDepth: 2,selectedDepth: 2,intensity: 1,
                shape: NeumorphicShape.concave
            ),
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
                _selectedIndex=1;
              });
            },
            padding: EdgeInsets.all(15.0),
            child: SvgPicture.asset("assets/icons/channels.svg",color:groupValue=="B"? NeumorphicTheme.currentTheme(context).accentColor:Color(0xFF919191)),
          ),

          NeumorphicRadio(
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),unselectedDepth: 2,selectedDepth: 2,intensity: 1,
                shape: NeumorphicShape.concave
            ),
            groupValue: groupValue,
            value: "C",
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
                _selectedIndex=2;
              });
            },
            padding: EdgeInsets.all(15.0),
            child: SvgPicture.asset("assets/icons/users.svg",color:groupValue=="C"? NeumorphicTheme.currentTheme(context).accentColor:Color(0xFF919191)),
          ),
          NeumorphicRadio(
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),unselectedDepth: 2,selectedDepth: 2,intensity: 1,
                shape: NeumorphicShape.concave
            ),
            groupValue: groupValue,
            value: "D",
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
                _selectedIndex=3;
              });
            },
            padding: EdgeInsets.all(15.0),
            child: SvgPicture.asset("assets/icons/settings.svg",color:groupValue=="D"? NeumorphicTheme.currentTheme(context).accentColor:Color(0xFF919191),),
          ),
        ],
      ),
    );
  }


  @override
  void initState() {
     _selectedIndex = widget.index;
    WidgetsBinding.instance!.addObserver(this);
    // initDynamicLinks(context);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: NeumorphicTheme.of(context)!.current!.baseColor,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Stack(
          children: [
            _children[_selectedIndex],
            Positioned(
              bottom: 12,
              left: 30,
              right: 30,
              child: SafeArea(
                child: Neumorphic(
                    style: NeumorphicStyle(
                        depth: 4,
                        intensity: .8,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(Radius.circular(30)),
                        ), lightSource: LightSource.top,surfaceIntensity: .3,shape: NeumorphicShape.concave
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                        child: _buildWidget(context))),
              ),
            )
          ],
        ),
      ), // new
    );
  }
}

