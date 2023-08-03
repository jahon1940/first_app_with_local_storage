import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_2907/core/constants/constants.dart';

import '../home/home_page.dart';
import '../receipt/receipt_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int _selectedIndex = 0;

class _MainPageState extends State<MainPage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          ReceiptPage(),
          ReceiptPage(),
          ReceiptPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomnavIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomnavIcons.payments),
              label: 'Payments'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomnavIcons.savings), label: 'Savings'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomnavIcons.wallets), label: 'Wallets'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff073B80),
        onTap: _onItemTapped,
      ),
    );
  }
}
