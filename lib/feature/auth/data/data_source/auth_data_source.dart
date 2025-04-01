import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/core/response_wrapper/data_response.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<ResponseWrapper<UserModel>?> logInUser(
      {required Map<String, dynamic> body});

  Future<ResponseWrapper?> signUpUser({required Map<String, dynamic> body});

  Future<ResponseWrapper?> createProfile({required Map<String, dynamic> body});

  Future<ResponseWrapper?> addAddress({required Map<String, dynamic> body});

  Future<ResponseWrapper?> addBankDetails({required Map<String, dynamic> body});

  Future<ResponseWrapper?> verifyEmail({required Map<String, dynamic> body});

  Future<ResponseWrapper?> forgetPassword({required Map<String, dynamic> body});

  Future<ResponseWrapper?> changePassword({required Map<String, dynamic> body});
}

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<ResponseWrapper<UserModel>?> logInUser(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.login,
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
    } catch (e) {
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "userLogin",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> signUpUser(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.signUp,
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
        functionName: "userSignUp",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> createProfile(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.createProfile,
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
        functionName: "userProfile",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> addAddress(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.addAddress,
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
        functionName: "addAddress",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> addBankDetails(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.addBankDetails,
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
        functionName: "addBankDetails",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> forgetPassword(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.forgetPassword,
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
        functionName: "forgetPassword",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> verifyEmail(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.verifyEmail,
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
        functionName: "verifyEmail",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> changePassword(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.changePassword,
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
        functionName: "changePassword",
      ));
    }
  }
}
