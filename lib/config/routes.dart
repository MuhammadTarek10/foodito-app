import 'package:flutter/material.dart';
import 'package:foodito/features/auth/presentation/views/login_view.dart';
import 'package:foodito/features/auth/presentation/views/onboarding_view.dart';
import 'package:foodito/features/auth/presentation/views/register_view.dart';
import 'package:foodito/features/auth/presentation/views/reset_password_view.dart';
import 'package:foodito/features/auth/presentation/views/verification_code_view.dart';
import 'package:foodito/features/home/offline/presentation/views/orders_view.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/views/room/create_room_view.dart';
import 'package:foodito/features/home/online/presentation/views/room/room_view.dart';
import 'package:foodito/features/home/online/presentation/views/room/rooms_view.dart';
import 'package:foodito/features/home/presentation/views/main/main_view.dart';
import 'package:foodito/features/splash_view.dart';

class Routes {
  static const String initialRoute = "/";
  static const String onboarding = "/onboarding";

  // * Login
  static const String login = "/login";
  static const String register = "/register";
  static const String resetPassword = "/reset-password";
  static const String verificationCode = "/verification-code";

  // * Home
  static const String home = "/home";

  // * Offline
  static const String order = "/offline-order";

  // * Online
  static const String createRoom = "/create-room";
  static const String rooms = "/rooms";
  static const String room = "/room";
}

class RouteGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordView());
      case Routes.verificationCode:
        return MaterialPageRoute(
          builder: (context) => VerificationCodeView(
            email: settings.arguments as String,
          ),
        );

      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const MainView());
      case Routes.order:
        return MaterialPageRoute(builder: (context) => const OrdersView());
      case Routes.createRoom:
        return MaterialPageRoute(builder: (context) => const CreateRoomView());
      case Routes.rooms:
        return MaterialPageRoute(builder: (context) => const RoomsView());
      case Routes.room:
        return MaterialPageRoute(
            builder: (context) => RoomView(
                  room: settings.arguments as Room,
                ));
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      default:
        return MaterialPageRoute(builder: (context) => const MainView());
    }
  }
}
