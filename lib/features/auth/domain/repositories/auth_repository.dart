import 'package:dartz/dartz.dart';
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register(
    String name,
    String email,
    String password,
  );
  Future<Either<Failure, bool>> logout();
}
