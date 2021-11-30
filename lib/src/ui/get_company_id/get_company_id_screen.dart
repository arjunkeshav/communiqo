

import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';


class GetCompanyId extends StatefulWidget {
  @override
  _GetCompanyIdState createState() => _GetCompanyIdState();
}

class _GetCompanyIdState extends State<GetCompanyId> {
  TextEditingController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(Assets.logo))),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.025,),
                  Container(height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Stack(
                      children: [
                        Neumorphic(
                          margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                          style: NeumorphicStyle(
                            depth:-2,shadowLightColor: Colors.white,shadowDarkColor: Colors.black45,intensity: .77,
                            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(8))),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                          child: TextFormField(
                            controller: _controller,
                            decoration: InputDecoration.collapsed(hintText: "Customer Id",hintStyle: TextStyle(color: NeumorphicTheme.currentTheme(context).defaultTextColor.withOpacity(.31),fontWeight: FontWeight.w700)),
                          ),
                        ),
                        Positioned(right: 0,top: 0,bottom: 0,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => LoginScreen()),
                              );
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(depth: 3,intensity:.9,boxShape: NeumorphicBoxShape.circle(),shape:NeumorphicShape.concave),
                              child: Container(height: 35,width: 35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset("assets/icons/login .svg"),
                                  )),),
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
