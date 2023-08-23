import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/core/errors/handler/error_handler.dart';
import 'package:foodito/core/network/network_info.dart';
import 'package:foodito/core/prefs.dart';
import 'package:foodito/features/auth/data/apis/responses/login_response.dart';
import 'package:foodito/features/auth/data/apis/responses/register_response.dart';
import 'package:foodito/features/auth/data/datasources/remote_datasource.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:foodito/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImplementer implements AuthRepository {
  final AppPreferences prefs;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImplementer({
    required this.prefs,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.login(email, password);
        final user = response.toDomain();
        prefs.setUser(user);
        prefs.setToken(user.token!);
        prefs.setLoggedIn();
        prefs.setSeenOnBoarding();
        await setTokenDio();
        return Right(user);
      } catch (e) {
        return Left(Failure(500, AppStrings.internal));
      }
    } else {
      return Left(Failure(500, AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      String name, String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.register(name, email, password);
        final user = response.toDomain();
        prefs.setUser(user);
        prefs.setToken(user.token!);
        prefs.setLoggedIn();
        prefs.setSeenOnBoarding();
        await setTokenDio();
        return Right(user);
      } on DioException catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.logout();
        prefs.clear();
        return const Right(true);
      } on DioException catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
