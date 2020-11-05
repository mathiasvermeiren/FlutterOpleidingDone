import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_haxx_app/pages/landing_page.dart';
import 'package:flutter_course_haxx_app/pages/session_detail_page.dart';
import 'package:flutter_course_haxx_app/pages/sign_up_page.dart';
import 'package:flutter_course_haxx_app/screens/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (x) => LandingPage());
      case "/profile":
        return MaterialPageRoute(builder: (x) => MainScreen(2));
      case "/signUp":
        return MaterialPageRoute(builder: (x) => SignUpPage());
      case "/speakers":
        return MaterialPageRoute(builder: (x) => MainScreen(1));
      case "/sessions":
        return MaterialPageRoute(builder: (x) => MainScreen(0));
      case "/sessiondetail":
        return MaterialPageRoute(
            builder: (x) => SessionDetailPage(itemKey: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (x) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("404: Page not found"),
        ),
      );
    });
  }
}
