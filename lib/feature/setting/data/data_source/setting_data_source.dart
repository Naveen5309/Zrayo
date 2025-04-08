import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/core/response_wrapper/data_response.dart';

abstract class SettingDataSource {
  Future<ResponseWrapper?> contactUs({required Map<String, dynamic> body});
  Future<ResponseWrapper?> logout({required Map<String, dynamic> body});
  Future<ResponseWrapper?> aboutUs({required Map<String, dynamic> body});
}

class SettingDataSourceImpl extends SettingDataSource {
  @override
  Future<ResponseWrapper<dynamic>?> contactUs(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        body: body,
        url: ApiEndpoints.contactUs,
        fromJson: (json) {
          printLog("json in data source :-> $json");

          return json;
        },
      );
      if (dataResponse.success == true) {
        return getSuccessResponseWrapper(dataResponse);
      } else {
        return getFailedResponseWrapper(dataResponse.message,
            response: dataResponse.data);
      }
    } catch (e) {
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "contactUs",
      ));
    }
  }

  @override
  Future<ResponseWrapper<dynamic>> logout(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        body: body,
        url: ApiEndpoints.logout,
        fromJson: (json) {
          printLog("json in data source :-> $json");

          return json;
        },
      );
      if (dataResponse.success == true) {
        return getSuccessResponseWrapper(dataResponse);
      } else {
        return getFailedResponseWrapper(dataResponse.message,
            response: dataResponse.data);
      }
    } catch (e) {
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "logout",
      ));
    }
  }

  @override
  Future<ResponseWrapper<dynamic>> aboutUs(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        body: body,
        url: ApiEndpoints.aboutUs,
        fromJson: (json) {
          printLog("json in data source :-> $json");

          return json;
        },
      );
      if (dataResponse.success == true) {
        return getSuccessResponseWrapper(dataResponse);
      } else {
        return getFailedResponseWrapper(dataResponse.message,
            response: dataResponse.data);
      }
    } catch (e) {
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "about us",
      ));
    }
  }
}
