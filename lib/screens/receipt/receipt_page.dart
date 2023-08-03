import 'package:flutter/material.dart';
import 'package:ui_2907/core/widgets/global_button.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          leading: Container(),
          elevation: 0,
          backgroundColor: Color(0xff31BBC5),
          expandedHeight: 124,
          floating: true,
          pinned: true,
          snap: true,
          flexibleSpace: const FlexibleSpaceBar(
            background: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'Receipt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Payment Successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 230,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/images/Card.png'),
                    fit: BoxFit.fitHeight),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: SizedBox(
                height: 630, child: Image.asset('assets/images/check.png')),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: GlobalButton(buttonName: 'CONTINUE', onTap: () {}),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Center(
              child: SizedBox(
                  height: 240, child: Image.asset('assets/images/watch.png')),
            ),
          ),
        ),
      ],
    );
  }
}
