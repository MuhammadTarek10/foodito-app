import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/network/error/failure.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:foodito/features/auth/presentation/state/notifiers/auth_notifier.dart';

final authProvider =
    StateNotifierProvider<AuthStateNotifier, Either<Failure, User>?>(
  (_) => AuthStateNotifier(),
);
