import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/prefs.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';

class UserNotifier extends StateNotifier<User?> {
  final AppPreferences prefs = instance<AppPreferences>();
  UserNotifier() : super(null);

  void getUser() {
    final user = prefs.getUser();
    if (user != null) {
      state = user;
    }
  }
}
