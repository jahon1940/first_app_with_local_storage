import 'package:flutter/material.dart';
import 'package:ui_2907/screens/main_page/main_page.dart';
import 'package:ui_2907/screens/home/home_page.dart';
import 'package:ui_2907/screens/login/login_page.dart';
import 'package:ui_2907/screens/receipt/receipt_page.dart';
import 'package:ui_2907/screens/register/register_page.dart';

import '../screens/splash/splash_page.dart';
import 'app_routes.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RouteName.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case RouteName.main:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteName.receipt:
        return MaterialPageRoute(builder: (_) => const ReceiptPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
