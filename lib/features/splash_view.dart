import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/prefs.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _prefs = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() async {
    _prefs.isLoggedIn().then((isUserLoggedIn) {
      if (isUserLoggedIn != null && isUserLoggedIn) {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      } else {
        _prefs.isSeenOnBoarding().then((isOnBoardingViewed) {
          if (isOnBoardingViewed != null && isOnBoardingViewed) {
            Navigator.of(context).pushReplacementNamed(Routes.login);
          } else {
            Navigator.of(context).pushReplacementNamed(Routes.onboarding);
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.onBoarding,
        ),
      ),
    );
  }
}
