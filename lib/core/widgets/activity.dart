import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
      child: Container(
        width: 344,
        height: 214,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Text(
                'Activity',
                style: TextStyle(
                  color: Color(0xFF073B80),
                  fontSize: 25,
                ),
              ),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: IntrinsicHeight(
                  child: Container(
                    height: 150,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 3.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                child: Container(
                  color: Colors.white,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 5, color: Color(0xFF34C759)),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 90,
                left: 16,
                child: Container(
                  color: Colors.white,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 5, color: Color(0xFFF20000)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bank deposit',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '\$100.00',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cash',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '4:26 PM',
                          style: TextStyle(
                            color: Color(0xFFA5A5A5),
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Apple Music',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '\$1.90',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Entertainment',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '6:14 PM',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFA5A5A5),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
