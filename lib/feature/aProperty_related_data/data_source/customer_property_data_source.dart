import 'dart:convert';

import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/core/response_wrapper/data_response.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_agents_list_model.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_type_model.dart';

abstract class CustomerPropertyDataSource {
  Future<ResponseWrapper<List<PropertyTypeAndFeaturesModel>>?>
      getPropertyTypesAndFeatures();
  Future<ResponseWrapper<List<PropertyAgentsListsModel>>?> getPropertyAgentList(
      {required Map<String, dynamic> body});
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
}
