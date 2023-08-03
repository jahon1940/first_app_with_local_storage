import 'package:flutter/material.dart';

class GradientBackgroundWidget extends StatelessWidget {
  const GradientBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                stops: [0.2, 0.9],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff31BBC5), Color(0xff322274)])),
        child: Stack(children: [
          Positioned(
              top: 120,
              child: Image.asset('assets/images/circle.png',
                  height: 270, fit: BoxFit.fill)),
          Positioned(
              top: 310,
              child: Image.asset('assets/images/line.png',
                  width: 430, fit: BoxFit.fill)),
        ]),
      ),
    ]);
  }
}
