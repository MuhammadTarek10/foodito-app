import 'package:foodito/config/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  final SharedPreferences sharedPreferences;
  const AppPreference({required this.sharedPreferences});

  String? getToken() {
    return sharedPreferences.getString(AppConstants.token);
  }

  void setToken(String token) {
    sharedPreferences.setString(AppConstants.token, token);
  }
}
