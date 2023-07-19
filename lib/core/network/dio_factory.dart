import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/prefs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppPreferences appPreference;
  DioFactory({required this.appPreference});

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String? token = appPreference.getToken();
    Map<String, String> headers = {
      AppConstants.contentType: AppConstants.applicationJson,
      AppConstants.accept: AppConstants.applicationJson,
      AppConstants.authorization: token ?? "",
    };

    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
      receiveTimeout: AppConstants.receiveTimeout,
      connectTimeout: AppConstants.connectTimeout,
      sendTimeout: AppConstants.sendTimeout,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }

    return dio;
  }

  Dio copyWithToken(String? token) {
    Dio dio = Dio();
    Map<String, String> headers = {
      AppConstants.contentType: AppConstants.applicationJson,
      AppConstants.accept: AppConstants.applicationJson,
      AppConstants.authorization: token ?? "",
    };

    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
      receiveTimeout: AppConstants.receiveTimeout,
      connectTimeout: AppConstants.connectTimeout,
      sendTimeout: AppConstants.sendTimeout,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
    return dio;
  }
}
