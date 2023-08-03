import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuickActions extends StatelessWidget {
  final String text;
  final String svg;
  const QuickActions({
    super.key,
    required this.text,
    required this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 115,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x28000000),
                blurRadius: 6,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(svg),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 18,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
