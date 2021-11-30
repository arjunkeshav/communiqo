import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonIcon extends StatelessWidget {
  final String iconPath;
  final double borderRadius;
  final VoidCallback action;
  final bool clicked;

  const ButtonIcon({Key? key, required this.iconPath, this.borderRadius = 8.0, required this.action,this.clicked =false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Neumorphic(style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),shape: NeumorphicShape.concave,depth: clicked?-2: 2),
        child: Container(
          height: 45,width: 45,
            padding: EdgeInsets.all(14.0),
            child: SvgPicture.asset(iconPath,color:clicked? NeumorphicTheme.currentTheme(context).accentColor:null,)
        ),
      ),
    );
  }
}
