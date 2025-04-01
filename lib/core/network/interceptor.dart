import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';

class Injector {
  static final Injector _singleton = Injector._internal();
  static final _dio = Dio();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  Dio getDio() {
    BaseOptions options = BaseOptions(
        receiveTimeout: const Duration(seconds: 90),
        connectTimeout: const Duration(seconds: 90));
    _dio.options = options;
    _dio.options.followRedirects = false;
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.interceptors.clear();
    _dio.interceptors.add(LoggingInterceptors());
    return _dio;
  }

  static Options getHeaderToken() {
    var headerOptions = Options(headers: {
      'Accept': 'application/json', // Always include this header
    });

    String? token = Getters.authToken;
    if (token != null) {
      printLog("AuthToken==>> Bearer $token");
      headerOptions.headers?['Authorization'] = 'Bearer $token';
    }

    return headerOptions;
  }
}

class LoggingInterceptors extends Interceptor {
  String printObject(Object object) {
    Map jsonMapped = json.decode(json.encode(object));
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyPrint = encoder.convert(jsonMapped);
    return prettyPrint;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    printLog(
        "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    printLog("Headers:");
    options.headers.forEach((k, v) => printLog('$k: $v'));
    printLog("queryParameters:");
    options.queryParameters.forEach((k, v) => printLog('$k: $v'));
    if (options.data != null) {
      try {
        FormData formData = options.data as FormData;
        printLog("Body:");
        var buffer = [];
        for (MapEntry<String, String> pair in formData.fields) {
          buffer.add('${pair.key}:${pair.value}');
        }
        printLog("Body:{${buffer.join(', ')}}");
      } catch (e) {
        printLog("Body: ${printObject(options.data)}");
      }
    }
    printLog(
        "--> END ${options.method.isNotEmpty ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    printLog(
        "<-- ${err.message} ${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
    printLog("${err.response != null ? err.response!.data : 'Unknown Error'}");
    printLog("<-- End error");
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printLog(
        "<-- ${response.statusCode} ${(response.requestOptions.baseUrl.isNotEmpty ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    printLog("Headers:");
    response.headers.forEach((k, v) => printLog('$k: $v'));
    printLog("Response: ${response.data}");
    printLog("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}
