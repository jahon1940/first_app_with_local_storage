import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_2907/core/constants/constants.dart';
import 'package:ui_2907/core/widgets/gradient_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_2907/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLog = false;
  Future<bool> isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLog = pref.getBool("isLoggedIn") ?? false;
    return pref.getBool("isLoggedIn") ?? false;
  }

  @override
  void initState() {
    super.initState();
    isLoggedIn();
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) {
        isLog
            ? Navigator.pushReplacementNamed(context, RouteName.main)
            : Navigator.pushReplacementNamed(context, RouteName.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const GradientBackgroundWidget(),
      Positioned(
          top: 250,
          left: 85,
          child: Image.asset(
            AppImages.cash,
            width: 280,
            fit: BoxFit.fill,
          )),
      Positioned.fill(
          top: 250,
          child: Center(
              child: Text(
            '   Pay Bill And\nTransfer Funds',
            style: GoogleFonts.abel(
                fontSize: 37, color: Colors.white, fontWeight: FontWeight.w500),
          )))
    ]));
  }
}
