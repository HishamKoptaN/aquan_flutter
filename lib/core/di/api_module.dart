import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../helpers/constants.dart';
import '../helpers/shared_pref_helper.dart';

@module
abstract class ApiModule {
  ApiModule() {
    log("ApiModule has been initialized! 🚀");
  }
  @singleton
  Dio dio(
    AuthInterceptor authInterceptor,
    LoggingInterceptor loggingInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://gapi.aquan.website/api/',
        connectTimeout: const Duration(
          seconds: 30,
        ),
        receiveTimeout: const Duration(
          seconds: 30,
        ),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    dio.interceptors.addAll(
      [
        authInterceptor,
        LogInterceptor(
          responseBody: true,
        ),
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      ],
    );
    return dio;
  }
}

@singleton
class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  String? _currentToken;
  AuthInterceptor(
    this.tokenStorage,
  );
  Future<void> updateToken() async {
    _currentToken = await tokenStorage.getToken();
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await tokenStorage.getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      super.onRequest(options, handler);
    } catch (e) {
      log('AuthInterceptor Error: $e');
      super.onRequest(options, handler);
    }
  }
}

@singleton
class LoggingInterceptor extends Interceptor {
  //! onRequest
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    log(
      'Request[${options.method}] => PATH: ${options.path}',
    );
    super.onRequest(options, handler);
  }

  //! onRequest
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    log(
      'Response[${response.statusCode}]: ${response.data}',
    );
    super.onResponse(
      response,
      handler,
    );
  }

  //! onError
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    log('Error[${err.response?.statusCode}]: ${err.message}');
    super.onError(err, handler);
  }
}

@lazySingleton
class TokenStorage {
  Future<String?> getToken() async {
    return await SharedPrefHelper.getSecuredString(
      key: SharedPrefKeys.userToken,
    );
  }
}
