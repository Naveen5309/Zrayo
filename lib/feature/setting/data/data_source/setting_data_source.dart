import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/core/response_wrapper/data_response.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';

abstract class SettingDataSource {
  Future<ResponseWrapper?> contactUs({required Map<String, dynamic> body});
}

class SettingDataSourceImpl extends SettingDataSource {
  @override
  Future<ResponseWrapper<UserModel>?> contactUs(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.contactUs,
        fromJson: (json) => UserModel.fromJson(json),
      );
      if (dataResponse.success == true) {
        // UserModel model = dataResponse.data!;
        // await Getters.getLocalStorage.saveLoginUser(model.user!);
        // await Getters.getLocalStorage.saveToken(model.token ?? "");
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
}
