
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/home/home_screen.dart';

class Routes {
  static const String home = 'home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        final String? param = settings.arguments?.toString();
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      default:
        return defaultScreen();
    }
  }

  static defaultScreen() {
    return MaterialPageRoute(builder: (contex) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      );
    });
  }
}
