
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class Avatar extends StatelessWidget {
  final double width;
  final double height;
  final String url;
  final bool isOnline;
  final bool circleShape;

  const Avatar(
      {Key? key,
      this.width = 60.0,
      this.height = 60.0,
      required this.url,
      this.isOnline = false,
      this.circleShape=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,intensity: .77,

          boxShape:circleShape? NeumorphicBoxShape.circle():null,
          depth: 3,
          lightSource: LightSource.topLeft,
          color: Colors.transparent,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape:circleShape? BoxShape.circle:BoxShape.rectangle,
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: circleShape?null:BorderRadius.all(Radius.circular(12)),

        ),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  shape:circleShape? BoxShape.circle:BoxShape.rectangle,
                  borderRadius: circleShape?null:BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: new NetworkImage(url))),
            ),
            // isOnline
            //     ? Positioned(
            //         child: OnlineIndicator(
            //           width: 0.26 * width,
            //           height: 0.26 * height,
            //         ),
            //         right: 3,
            //         bottom: 3,
            //       )
            //     : SizedBox()
          ],
        ),
      ),
    );
  }
}
