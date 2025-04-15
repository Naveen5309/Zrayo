import 'dart:io';

import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/core/response_wrapper/data_response.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<ResponseWrapper<UserModel>?> logInUser(
      {required Map<String, dynamic> body});

  Future<ResponseWrapper<UserModel>?> getProfile();

  Future<ResponseWrapper?> signUpUser({required Map<String, dynamic> body});

  Future<ResponseWrapper?> createUpdateProfile(
      {required Map<String, dynamic> body, required bool isUpdateCall});

  Future<ResponseWrapper?> uploadDocument({File? frontSide, File? backSide});

  Future<ResponseWrapper?> uploadFile(
      {required File file, required String endPoint});

  Future<ResponseWrapper?> addAddress(
      {required Map<String, dynamic> body, required bool isUpdate});

  Future<ResponseWrapper?> verifyEmail({required Map<String, dynamic> body});

  Future<ResponseWrapper?> forgetPassword({required Map<String, dynamic> body});

  Future<ResponseWrapper?> changePassword({required Map<String, dynamic> body});

  Future<ResponseWrapper?> resendOtp({required Map<String, dynamic> body});

  Future<ResponseWrapper?> bankDetails({required Map<String, dynamic> body});
}

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<ResponseWrapper<UserModel>?> getProfile() async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        url: ApiEndpoints.userDetail,
        requestType: RequestType.get,
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
      functionLog(msg: t.toString(), fun: "userLogin");
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "userLogin",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> logInUser(
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
      functionLog(msg: t.toString(), fun: "userLogin");
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
        url: ApiEndpoints.signUp,
        fromJson: (json) => UserModel.fromJson(json),
      );
      if (dataResponse.success == true) {
        await Getters.getLocalStorage.saveToken(dataResponse.data?.token ?? "");
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
  Future<ResponseWrapper<UserModel>?> createUpdateProfile({
    required Map<String, dynamic> body,
    required bool isUpdateCall,
  }) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: isUpdateCall
            ? ApiEndpoints.updateProfile
            : ApiEndpoints.createProfile,
        useFormData: true,
        fromJson: (json) => UserModel.fromJson(json),
      );
      if (dataResponse.success == true) {
        UserModel model = dataResponse.data ?? UserModel();
        await Getters.getLocalStorage.saveLoginUser(model);
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
  Future<ResponseWrapper<String>?> uploadFile(
      {required File file, required String endPoint}) async {
    try {
      Map<String, dynamic> map = {};
      final img = await Utils.makeMultipartFile(file.path);
      map.addAll({"image": img});
      final dataResponse = await Getters.getHttpService.request<String>(
        body: map,
        url: endPoint,
        useFormData: true,
        fromJson: (json) => json['filename'],
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
        functionName: "uploadFile",
      ));
    }
  }

  @override
  Future<ResponseWrapper<dynamic>?> uploadDocument({
    File? frontSide,
    File? backSide,
  }) async {
    try {
      Map<String, dynamic> map = {};

      if (frontSide != null && (frontSide.path.isNotEmpty)) {
        final uploadRes = await uploadFile(
            file: frontSide, endPoint: ApiEndpoints.uploadFile);
        if (uploadRes?.success == true) {
          map["idDocumentFront"] = uploadRes?.data;
        } else {
          return getFailedResponseWrapper(uploadRes?.message ?? "",
              response: uploadRes?.data);
        }
      }
      if (backSide != null && (backSide.path.isNotEmpty)) {
        final uploadRes =
            await uploadFile(file: backSide, endPoint: ApiEndpoints.uploadFile);
        if (uploadRes?.success == true) {
          map["idDocumentBack"] = uploadRes?.data;
        } else {
          return getFailedResponseWrapper(uploadRes?.message ?? "",
              response: uploadRes?.data);
        }
      }
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        body: map,
        url: ApiEndpoints.addDocument,
        fromJson: (json) => json,
      );
      if (dataResponse.success == true) {
        UserModel? userModel = Getters.getLocalStorage.getLoginUser();
        await Getters.getLocalStorage.saveLoginUser(userModel?.copyWith(
                detail: userModel.detail?.copyWith(
                    idDocumentFront: dataResponse.data['idDocumentFront'],
                    idDocumentBack: dataResponse.data['idDocumentBack'])) ??
            UserModel());
        return getSuccessResponseWrapper(dataResponse);
      } else {
        return getFailedResponseWrapper(dataResponse.message,
            response: dataResponse.data);
      }
    } catch (e) {
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "uploadDocument",
      ));
    }
  }

  @override
  Future<ResponseWrapper<dynamic>?> addAddress(
      {required Map<String, dynamic> body, required bool isUpdate}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        body: body,
        url: isUpdate ? ApiEndpoints.updateAddress : ApiEndpoints.addAddress,
        fromJson: (json) {
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
        functionName: "addAddress",
      ));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>?> forgetPassword(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiEndpoints.forgetPassword,
        fromJson: (json) => UserModel.fromJson(json),
      );
      if (dataResponse.success == true) {
        await Getters.getLocalStorage.saveToken(dataResponse.data?.token ?? "");
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
        url: ApiEndpoints.verifyEmail,
        fromJson: (json) => UserModel.fromJson(json),
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
        functionName: "verifyEmail",
      ));
    }
  }

  @override
  Future<ResponseWrapper<dynamic>?> changePassword(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        body: body,
        url: ApiEndpoints.changePassword,
        fromJson: (json) {
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
        functionName: "changePassword",
      ));
    }
  }

  @override
  Future<ResponseWrapper<dynamic>> resendOtp(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        body: body,
        url: ApiEndpoints.resendOtp,
        fromJson: (json) {
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
        functionName: "resend otp",
      ));
    }
  }

  @override
  Future<ResponseWrapper<dynamic>> bankDetails(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        body: body,
        url: ApiEndpoints.addBankDetails,
        fromJson: (json) {
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
        functionName: "bankDetails",
      ));
    }
  }
}
