import 'dart:convert';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/core/response_wrapper/data_response.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_agents_list_model.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_type_model.dart';
import 'package:zrayo_flutter/feature/auth/data/data_source/auth_data_source.dart';

abstract class CustomerPropertyDataSource {
  Future<ResponseWrapper<List<PropertyTypeAndFeaturesModel>>?>
      getPropertyTypesAndFeatures();

  Future<ResponseWrapper<List<PropertyAgentsListsModel>>?> getPropertyAgentList(
      {required Map<String, dynamic> body});

  Future<ResponseWrapper<dynamic>> addPropertyBio(
      {required Map<String, dynamic> body, required List<File> propertyImages});
}

class CustomerPropertyDataSourceImpl extends CustomerPropertyDataSource {
  @override
  Future<ResponseWrapper<List<PropertyTypeAndFeaturesModel>>?>
      getPropertyTypesAndFeatures() async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        url: ApiEndpoints.propertyTypesAndFeatures,
        body: {},
        fromJson: (dynamic json) {
          if (json != null && (json as List).isNotEmpty) {
            return List<PropertyTypeAndFeaturesModel>.from(
              json.map((x) => propertyTypeModelFromJson(jsonEncode(x))),
            );
          } else {
            return <PropertyTypeAndFeaturesModel>[];
          }
        },
      );
      if (dataResponse.success == true) {
        return getSuccessResponseWrapper(dataResponse);
      } else {
        return getFailedResponseWrapper(dataResponse.message,
            response: dataResponse.data);
      }
    } catch (e, t) {
      functionLog(msg: t.toString(), fun: "getPropertyTypesAndFeatures");
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "getPropertyTypesAndFeatures",
      ));
    }
  }

  @override
  Future<ResponseWrapper<List<PropertyAgentsListsModel>>?> getPropertyAgentList(
      {required Map<String, dynamic> body}) async {
    try {
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        url: ApiEndpoints.propertyAgentsList,
        body: body,
        fromJson: (dynamic json) {
          if (json != null && (json as List).isNotEmpty) {
            return List<PropertyAgentsListsModel>.from(
              json.map((x) => propertyAgentsListsModelFromJson(jsonEncode(x))),
            );
          } else {
            return <PropertyAgentsListsModel>[];
          }
        },
      );
      if (dataResponse.success == true) {
        return getSuccessResponseWrapper(dataResponse);
      } else {
        return getFailedResponseWrapper(dataResponse.message,
            response: dataResponse.data);
      }
    } catch (e, t) {
      functionLog(msg: t.toString(), fun: "getPropertyAgentList");
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "getPropertyAgentList",
      ));
    }
  }

  @override
  Future<ResponseWrapper<dynamic>> addPropertyBio(
      {required Map<String, dynamic> body,
      required List<File> propertyImages}) async {
    try {
      /// upload all property images first
      final authRepo = GetIt.I.get<AuthDataSource>();
      List<String> propertyImagesName = [];
      for (var element in propertyImages) {
        final uploadRes = await authRepo.uploadFile(
            file: element, endPoint: ApiEndpoints.uploadFile);
        if (uploadRes?.success == true) {
          propertyImagesName.add(uploadRes?.data);
        }
      }
      final dataResponse = await Getters.getHttpService.request<dynamic>(
        url: ApiEndpoints.propertyAgentsList,
        body: body,
        fromJson: (dynamic json) {
          if (json != null && (json as List).isNotEmpty) {
            return List<PropertyAgentsListsModel>.from(
              json.map((x) => propertyAgentsListsModelFromJson(jsonEncode(x))),
            );
          } else {
            return <PropertyAgentsListsModel>[];
          }
        },
      );
      if (dataResponse.success == true) {
        return getSuccessResponseWrapper(dataResponse);
      } else {
        return getFailedResponseWrapper(dataResponse.message,
            response: dataResponse.data);
      }
    } catch (e, t) {
      functionLog(msg: t.toString(), fun: "getPropertyAgentList");
      return getFailedResponseWrapper(exceptionHandler(
        e: e,
        functionName: "getPropertyAgentList",
      ));
    }
  }
}
