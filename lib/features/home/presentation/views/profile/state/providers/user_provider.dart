import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:foodito/features/home/presentation/views/profile/state/notifiers/user_notifier.dart';

final userProvider = StateNotifierProvider<UserNotifier, User?>(
  (_) => UserNotifier(),
);
