import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/prefs.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';

class UserNotifier extends StateNotifier<User?> {
  final AppPreferences prefs = instance<AppPreferences>();

  UserNotifier() : super(null) {
    getUser();
  }

  void setUser(User user) {
    state = user;
  }

  Future<void> getUser() async {
    state = prefs.getUser();
  }
}
