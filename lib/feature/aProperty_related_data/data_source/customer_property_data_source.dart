
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/core/response_wrapper/data_response.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';

abstract class CustomerPropertyDataSource {
  Future<ResponseWrapper<UserModel>?> createProperty(
      {required Map<String, dynamic> body});
}

class CustomerPropertyDataSourceImpl extends CustomerPropertyDataSource {
  @override
  Future<ResponseWrapper<UserModel>?> createProperty(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiEndpoints.login,
        fromJson: (json) => UserModel.fromJson(json),
      );
      if (dataResponse.success == true) {
        await Getters.getLocalStorage.saveToken(dataResponse.data?.token ?? "");
        await Getters.getLocalStorage
            .saveLoginUser(dataResponse.data ?? UserModel());
        return getSuccessResponseWrapper(dataResponse);
      } else {
        return getFailedResponseWrapper(dataResponse.message,
            response: dataResponse.data);
      }
    } catch (e, t) {
      functionLog(msg: t.toString(), fun: "createProperty");
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "createProperty",
      ));
    }
  }
}
