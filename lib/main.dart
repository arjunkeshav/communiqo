import 'package:communiqo/src/ui/get_company_id/get_company_id_screen.dart';
import 'package:communiqo/src/ui/login/login_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Communiqo',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFE5E6EC),
        // baseColor: Color(0xFF87856b),
          shadowLightColor: Colors.white,shadowDarkColor: Colors.black54,
        lightSource: LightSource.topLeft,accentColor: Color(0xFF00AAE2),
        defaultTextColor: Color(0xFF273850).withOpacity(.81),
        depth: 10,intensity: .9,shadowLightColorEmboss: Colors.white,shadowDarkColorEmboss: Colors.black54
      ),
      darkTheme: NeumorphicThemeData(
          accentColor: Color(0xFF00AAE2),
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        defaultTextColor: Colors.white70,
          shadowLightColor:Colors.black54,shadowDarkColor: Colors.white,
        depth: 10,intensity: .5,
          shadowLightColorEmboss: Colors.white54,shadowDarkColorEmboss: Colors.black26
      ),
      home:LoginScreen(),
      // home:HomeNavigation(index: 0,),
    );
  }
}
