import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/core/prefs.dart';
import 'package:foodito/features/auth/data/repositories/auth_repository_implementer.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:foodito/features/auth/domain/repositories/auth_repository.dart';

class AuthStateNotifier extends StateNotifier<Either<Failure, User>?> {
  final AuthRepository repository = instance<AuthRepositoryImplementer>();
  final AppPreferences prefs = instance<AppPreferences>();
  AuthStateNotifier() : super(null) {
    final user = prefs.getUser();
    if (user != null) state = Right(user);
  }

  Future<void> login(String email, String password) async {
    state = await repository.login(email, password);
  }

  Future<void> register(String name, String email, String password) async {
    state = await repository.register(name, email, password);
  }

  Future<bool> logout() async {
    return (await repository.logout()).fold(
      (l) => false,
      (r) => true,
    );
  }
}
