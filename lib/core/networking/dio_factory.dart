import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/constants.dart';
import '../helpers/shared_pref_helper.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Future<Dio> setupDio() async {
    Duration timeOut = const Duration(
      seconds: 15,
    );
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(
            key: SharedPrefKeys.userToken,
          )}',
        };
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static void setTokenIntoHeaderAfterLogin({
    required String token,
  }) async {
    dio?.options.headers = {
      'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(
        key: SharedPrefKeys.userToken,
      )}',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }
}
