// import 'package:flutter/foundation.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/src/screens/profile_screen.dart';
import 'package:page_transition/page_transition.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(),
//       ),
//     );
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
      ),
      title: 'Food Week',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
                child: HomePage(), type: PageTransitionType.fade);
            break;
          case '/profile':
            return PageTransition(
                child: ProfileScreen(), type: PageTransitionType.fade);
            break;
          default:
            return null;
        }
      },
    );
  }
}
