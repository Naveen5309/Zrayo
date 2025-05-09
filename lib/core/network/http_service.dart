import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:zrayo_flutter/config/app_utils.dart';

import '../../config/helper.dart';
import '../response_wrapper/data_response.dart';
import 'interceptor.dart';

part '../../config/api_endpoints.dart';
part '../error/exceptions.dart';

enum RequestType {
  post,
  get,
  delete,
  put,
  multipart,
}

class ApiProvider {
  late Dio _dio;

  ApiProvider() {
    _dio = Injector().getDio();
  }

  ///  ---------------------------------Create a Network Request ---------------------------------------->

  Future<ResponseWrapper<T?>> request<T>({
    required String url,
    RequestType requestType = RequestType.post,
    Map<String, dynamic>? body,
    String? imagePath,
    String? paramName,
    bool useFormData = false,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      Map<String, dynamic> map = body ?? {};
      Response response = await _checkRequest(
        fullUrl: "${ApiEndpoints.baseUrl}/$url",
        imagePath: imagePath,
        paramName: paramName,
        requestType: requestType,
        body: map,
        useFormData: useFormData,
      );
      var parsedData =
          (response.data).containsKey('data') && response.data["data"] != null
              ? _dataParser<T>(response.data["data"], fromJson)
              : null;
      var dataResponse = ResponseWrapper<T>(
        status: response.data["status"],
        message: response.data["message"],
        success: response.data["success"],
        data: parsedData,
      );
      return dataResponse;
    } catch (err, c) {
      functionLog(msg: "t>>>>>>>>$err", fun: "requestData");
      functionLog(msg: "t>>>>>>>>$c", fun: "requestData");
      if (err is DioException) {
        if (err.type == DioExceptionType.receiveTimeout ||
            err.type == DioExceptionType.connectionTimeout) {
          return ResponseWrapper(
              status: 0,
              message: "Unable to reach the servers",
              success: false);
        } else if (err.type == DioExceptionType.connectionError) {
          return ResponseWrapper(
              status: 0,
              message: "Please check your internet connection",
              success: false);
        } else if (err.response != null && (err.response?.statusCode == 401)) {
          throw ResponseWrapper(
              status: 0, message: "Authentication Failed", success: false);
        }
      }
      final res = (err as dynamic).response;
      if (res != null && res?.data.runtimeType != String) {
        return ResponseWrapper.fromJson(
          res?.data,
          (data) => null,
        );
      }
      return ResponseWrapper(
          status: 0, message: err.toString(), success: false);
    }
  }

  ///  ---------------------------------Get request Type ---------------------------------------->
  Future<Response> _checkRequest({
    required String fullUrl,
    required RequestType requestType,
    required String? imagePath,
    required String? paramName,
    bool useFormData = false,
    required Map<String, dynamic> body,
  }) async {
    final headerToken = Injector.getHeaderToken();
    if (requestType == RequestType.get) {
      return _dio.get(
        fullUrl,
        options: headerToken,
        queryParameters: body,
      );
    } else if (requestType == RequestType.post) {
      return _dio.post(
        fullUrl,
        data: useFormData ? FormData.fromMap(body) : body,
        options: headerToken,
      );
    } else if (requestType == RequestType.multipart &&
        imagePath != null &&
        paramName != null) {
      Map<String, dynamic> map = HashMap();
      map.addAll(body);
      if (imagePath.isNotEmpty) {
        map[paramName] = Utils.makeMultipartFile(imagePath);
      }
      return _dio.post(
        fullUrl,
        data: FormData.fromMap(map),
        options: headerToken,
      );
    } else if (requestType == RequestType.delete) {
      return _dio.delete(
        fullUrl,
        data: body,
        options: headerToken,
      );
    } else if (requestType == RequestType.put) {
      return _dio.put(
        fullUrl,
        data: body,
        options: headerToken,
      );
    } else {
      return _dio.patch(
        fullUrl,
        data: body,
        options: headerToken,
      );
    }
  }

  T _dataParser<T>(dynamic json, T Function(dynamic) fromJson) {
    return fromJson(json);
  }
}
