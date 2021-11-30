import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/ui/home_navigation/home_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.of(context)!.current!.baseColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.splash_background),fit: BoxFit.fill)),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height * .3,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(Assets.logo))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Visibility(
                    visible: true,
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Neumorphic(
                        margin:
                            EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                        style: NeumorphicStyle(
                          depth: -3,intensity: .72,shadowLightColor: Colors.white,shadowDarkColor: Colors.black12,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.all(Radius.circular(8))),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                        child: TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                              hintText: "Customer Id",
                              isDense: true,
                              prefixIcon: Icon(Icons.person),
                              border: InputBorder.none,
                              alignLabelWithHint: true,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle: TextStyle(
                                  color: NeumorphicTheme.currentTheme(context)
                                      .defaultTextColor
                                      .withOpacity(.31),
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Neumorphic(
                      margin:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                      style: NeumorphicStyle(
                        depth: -4,intensity: .65,shadowLightColor: Colors.white,shadowDarkColor: Colors.black12,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(Radius.circular(8))),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                            hintText: "Username",
                            isDense: true,
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                            alignLabelWithHint: true,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle: TextStyle(
                                color: NeumorphicTheme.currentTheme(context)
                                    .defaultTextColor
                                    .withOpacity(.31),
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Neumorphic(
                      margin:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                      style: NeumorphicStyle(
                        depth: -4,intensity: .65,shadowLightColor: Colors.white,shadowDarkColor: Colors.black12,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(Radius.circular(8))),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                            hintText: "Password",
                            isDense: true,
                            prefixIcon: Icon(Icons.lock),
                            border: InputBorder.none,
                            alignLabelWithHint: true,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle: TextStyle(
                                color: NeumorphicTheme.currentTheme(context)
                                    .defaultTextColor
                                    .withOpacity(.31),
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  NeumorphicButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomeNavigation(index: 0,)),
                      );
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 36.0, vertical: 8),
                    style: NeumorphicStyle(
                      depth: 2,
                      intensity: .9,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "LOGIN",
                          style: TextStyle(
                              color: NeumorphicTheme.currentTheme(context)
                                  .defaultTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        // SvgPicture.asset("assets/icons/login .svg",)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
