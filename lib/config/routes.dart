import 'package:flutter/material.dart';
import 'package:foodito/features/offline/presentation/views/home_view.dart';

class Routes {
  static const String initialRoute = "/";

  // * Login
  static const String login = "/login";
  static const String register = "/register";

  // * Offline

  // * Online
}

class RouteGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return MaterialPageRoute(builder: (context) => const HomeView());
    }
  }
}
