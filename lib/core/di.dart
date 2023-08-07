import 'package:dio/dio.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/media.dart';
import 'package:foodito/core/network/client.dart';
import 'package:foodito/core/network/dio_factory.dart';
import 'package:foodito/core/network/network_info.dart';
import 'package:foodito/core/prefs.dart';
import 'package:foodito/features/auth/data/datasources/remote_datasource.dart';
import 'package:foodito/features/auth/data/repositories/auth_repository_implementer.dart';
import 'package:foodito/features/home/offline/data/datasource/local_datasource.dart';
import 'package:foodito/features/home/offline/data/repositories/list_repository_implementer.dart';
import 'package:foodito/features/home/online/data/datasource/room_datasource.dart';
import 'package:foodito/features/home/online/data/repositories/room_repository_implementer.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initApp() async {
  instance.allowReassignment = true;
  // * App Preferences
  final shared = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => shared);
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(prefs: instance<SharedPreferences>()));

  // * Network Info
  instance.registerLazySingleton<NetworkInfoImp>(
      () => NetworkInfoImp(InternetConnectionChecker()));

  // * App Media
  instance.registerLazySingleton<AppMedia>(
      () => AppMedia(imagePicker: ImagePicker()));

  // * Dio Factory
  instance.registerFactory<DioFactory>(
      () => DioFactory(appPreference: instance<AppPreferences>()));

  // * App Service Client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerFactory<AppServiceClient>(() => AppServiceClient(dio));

  // * Auth Remote Data Source
  instance.registerFactory<AuthRemoteDataSourceImplementer>(() =>
      AuthRemoteDataSourceImplementer(client: instance<AppServiceClient>()));

  // * Auth Repository
  instance.registerFactory<AuthRepositoryImplementer>(() =>
      AuthRepositoryImplementer(
          prefs: instance<AppPreferences>(),
          networkInfo: instance<NetworkInfoImp>(),
          remoteDataSource: instance<AuthRemoteDataSourceImplementer>()));

  Box box = Hive.box(AppConstants.orders);
  // * List Data Source
  instance.registerFactory<ListDataSourceImplementer>(
      () => ListDataSourceImplementer(box: box));

  // * List Repository
  instance.registerFactory<ListRepositoryImplementer>(() =>
      ListRepositoryImplementer(
          dataSource: instance<ListDataSourceImplementer>()));

  // * Room Data Source
  instance.registerFactory<RoomDatasourceImplementer>(
      () => RoomDatasourceImplementer(client: instance<AppServiceClient>()));

  // * Room Repository
  instance.registerFactory<RoomRepositoryImplementer>(
    () => RoomRepositoryImplementer(
      prefs: instance<AppPreferences>(),
      networkInfo: instance<NetworkInfoImp>(),
      datasource: instance<RoomDatasourceImplementer>(),
    ),
  );
}

Future<void> setTokenDio() async {
  Dio dio = instance<DioFactory>()
      .copyWithToken(instance<AppPreferences>().getToken());
  instance.registerFactory<AppServiceClient>(() => AppServiceClient(dio));
}
