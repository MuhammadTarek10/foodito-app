import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodito/config/language.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences prefs;
  const AppPreferences({required this.prefs});

  // * Basic
  Future<bool?> isSeenOnBoarding() async {
    return prefs.getBool(AppConstants.isSeenOnBoarding);
  }

  void setSeenOnBoarding() {
    prefs.setBool(AppConstants.isSeenOnBoarding, true);
  }

  Future<bool?> isLoggedIn() async {
    return prefs.getBool(AppConstants.isLoggedIn);
  }

  void setLoggedIn() {
    prefs.setBool(AppConstants.isLoggedIn, true);
  }

  void setLoggedOut() {
    prefs.setBool(AppConstants.isLoggedIn, false);
  }

  void clear() {
    prefs.clear();
  }

  // * User
  void setUser(User user) {
    prefs.setString(AppConstants.user, jsonEncode(user.toJson()));
  }

  User? getUser() {
    String? user = prefs.getString(AppConstants.user);
    if (user != null && user.isNotEmpty) {
      return User.fromJson(jsonDecode(user));
    }
    return null;
  }

  String? getToken() {
    return prefs.getString(AppConstants.token);
  }

  void setToken(String token) {
    prefs.setString(AppConstants.token, token);
  }

  // * Locale
  static const prefKeyLang = 'prefKeyLang';
  Future<String> getAppLanguage() async {
    String? language = prefs.getString(prefKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }

  Future<Locale> getLocale() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocale;
    }
    return englishLocale;
  }
}
