import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommarce_app/screens/auth/login.dart';
import 'package:ecommarce_app/screens/homepage.dart';
import 'package:ecommarce_app/utils/shared_preffrence.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  Widget nextWidget = const Login_Page();

  toNext() {
    Preffrence().getToken().then((value) {
      if (value != 'NA') {
        nextWidget = const HomePage();
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => const HomePage(),
        //   ),
        // );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "assets/logo.gif",
      nextScreen: nextWidget,
      animationDuration: Duration(seconds: 6),
      centered: true,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
