import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  const GlobalButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 278,
        height: 67,
        decoration: ShapeDecoration(
          color: Color(0xFF31BBC5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x42FFFFFF),
              blurRadius: 10,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            buttonName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Asap',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
