import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_2907/core/constants/constants.dart';
import 'package:ui_2907/core/widgets/activity.dart';

import '../../core/widgets/quick_actions.dart';
import '../../core/widgets/transactions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);
  int _activePage = 0;

  final List<Widget> _Pages = [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage(HomePageImages.card1), fit: BoxFit.fitHeight),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage(HomePageImages.card2), fit: BoxFit.fitHeight),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage(HomePageImages.card3), fit: BoxFit.fitHeight),
      ),
    ),
  ];
  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          leading:
              SvgPicture.asset(HomePageIcons.drawerIcon, fit: BoxFit.scaleDown),
          actions: const [
            Row(
              children: [
                Text(
                  'Hello, Tom',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(HomePageImages.julian),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                      controller: _pageViewController,
                      onPageChanged: (int index) {
                        setState(() {
                          _activePage = index;
                        });
                      },
                      itemCount: _Pages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _Pages[index];
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        _Pages.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                onTap: () {
                                  _pageViewController.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: _activePage == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(HomePageIcons.union),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Hold your phone near the terminal',
                      style: TextStyle(
                        color: Color(0xFFB6B6B6),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
                  child: Text(
                    'Quick Actions',
                    style: TextStyle(
                      color: Color(0xFF073B80),
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 139,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        QuickActions(
                            text: 'Transfer funds', svg: HomePageIcons.send),
                        QuickActions(
                            text: 'Top up savings', svg: HomePageIcons.pig),
                        QuickActions(
                            text: 'Electricity bill', svg: HomePageIcons.note)
                      ]),
                ),
                const ActivityWidget(),
                const ActivityWidget(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: 340,
                    height: 315,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 50,
                          offset: Offset(0, 9),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your total balance',
                                style: TextStyle(
                                  color: Color(0xFF3A3A3A),
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '...',
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '\$8500.00',
                            style: TextStyle(
                              color: Color(0xFF2D99FF),
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Image.asset(
                              HomePageImages.columns,
                              height: 180,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 20, bottom: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(HomePageIcons.qr),
                            ),
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.93),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paid by',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    'Ralph Edwards',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Text(
                                  '54x xxxxx xxx 24',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '12356 0800963',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset(HomePageIcons.wallet),
                            ),
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.93),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paid to',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Theresa Webb',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Text(
                                '12356 0800963',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 375,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x28212121),
                        blurRadius: 24,
                        offset: Offset(0, -4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 55,
                            height: 5,
                            decoration: ShapeDecoration(
                              color: Color(0xFFC4C4C4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Text(
                          'Transactions',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 500,
                          child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                Transactions(
                                    svg: HomePageIcons.shopping,
                                    title: 'Shopping',
                                    subtitle: '2 transactions',
                                    transactions: '\$ 425.43'),
                                Transactions(
                                    svg: HomePageIcons.entertaiment,
                                    title: 'Entertaiment',
                                    subtitle: '3 transactions',
                                    transactions: '\$ 110.15'),
                                Transactions(
                                    svg: HomePageIcons.commuting,
                                    title: 'Commuting',
                                    subtitle: '11 transactions',
                                    transactions: '\$ 67.54'),
                                Transactions(
                                    svg: HomePageIcons.food,
                                    title: 'Food & Drinks',
                                    subtitle: '6 transactions',
                                    transactions: '\$ 128.68'),
                                Transactions(
                                    svg: HomePageIcons.gym,
                                    title: 'Gym',
                                    subtitle: '3 transactions',
                                    transactions: '\$ 149.99'),
                                Transactions(
                                    svg: HomePageIcons.grocery,
                                    title: 'Grocery',
                                    subtitle: '3 transactions',
                                    transactions: '\$ 95.40'),
                              ])),
                      Center(
                        child: SizedBox(
                            height: 240,
                            child: Image.asset(HomePageImages.phone)),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
