import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_agents_list_model.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_type_model.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/repositories/customer_property_repo_implementation.dart';

import '../states/my_property_states.dart';

class MyPropertyNotifier extends StateNotifier<MyPropertyState> {
  final CustomerPropertyRepository customerPropertyRepo;

  MyPropertyNotifier({required this.customerPropertyRepo})
      : super(MyPropertyInitial()) {
    getPropertyTypesAndFeatures();
    getPropertyAgentList();
  }

  List<PropertyTypeAndFeaturesModel>? propertyTypesAndFeatures =
      <PropertyTypeAndFeaturesModel>[];
  List<PropertyAgentsListsModel>? propertyAgentsList =
      <PropertyAgentsListsModel>[];
  List<PropertyAgentsListsModel> selectedAgents = [];
  PropertyTypeAndFeaturesModel? selectedPropertyType;
  List<PropertyTypeAndFeaturesModel>? selectedPropertyFeatures =
      <PropertyTypeAndFeaturesModel>[];
  PropertyListingType? sellOrRentType;
  int? assignAgent;
  TextEditingController? otherFeature = TextEditingController();
  TextEditingController? bathroomSize = TextEditingController();
  TextEditingController? bedroomSize = TextEditingController();

  TextEditingController propertyTitleController = TextEditingController();
  TextEditingController propertyPriceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController commissionPercentageController =
      TextEditingController();
  TextEditingController otherPropertyFeatureController =
      TextEditingController();
  List<File> propertyImagesFiles = [];

  void addImage(File image) {
    propertyImagesFiles = [...propertyImagesFiles, image];
    _updateState();
  }

  void removeImage(File image) {
    propertyImagesFiles =
        propertyImagesFiles.where((img) => img != image).toList();
    _updateState();
  }

  void _updateState() {
    state = MyPropertyRefresh();
  }

  void setSelectedPropertyType(String? value) {
    selectedPropertyType = propertyTypesAndFeatures?.firstWhereOrNull(
      (v) => v.title == value,
    );
    selectedPropertyFeatures?.clear();
    state = MyPropertyRefresh();
  }

  void setSellOrRentType(PropertyListingType type) {
    sellOrRentType = type;
    state = MyPropertyRefresh();
  }

  void setSelectedPropertyFeatures(PropertyTypeAndFeaturesModel? value) {
    if (selectedPropertyFeatures?.any(
          (element) => element.title == value?.title,
        ) ??
        false) {
      selectedPropertyFeatures?.remove(value);
    } else {
      selectedPropertyFeatures?.add(value!);
    }
    state = MyPropertyRefresh();
  }

  Future<bool?> getPropertyTypesAndFeatures() async {
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const MyPropertyFailed(error: "No internet connection");
      }

      final result = await customerPropertyRepo.getPropertyTypesAndFeatures();
      result?.fold((error) {
        return MyPropertyFailed(error: error.message);
      }, (result) {
        propertyTypesAndFeatures = result;

        return MyPropertyRefresh();
      });
    } catch (e) {
      state = MyPropertyFailed(error: e.toString());
    }
    return false;
  }

  Future<bool?> getPropertyAgentList() async {
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const MyPropertyFailed(error: "No internet connection");
        return false;
      }

      Map<String, dynamic> body = {
        "pageNo": 0,
      };

      final result = await customerPropertyRepo.propertyAgentsList(body: body);

      return result?.fold((error) {
        state = MyPropertyFailed(error: error.message);
        return false;
      }, (result) {
        propertyAgentsList = result;
        state = MyPropertyRefresh();
        return true;
      });
    } catch (e) {
      state = MyPropertyFailed(error: e.toString());
      return false;
    }
  }

  void assignAgentValue(int? value) {
    assignAgent = value;
    state = MyPropertyRefresh();
  }

  void toggleAgentSelection(PropertyAgentsListsModel agent) {
    final isSelected = selectedAgents.any((a) => a.id == agent.id);

    if (isSelected) {
      selectedAgents.removeWhere((a) => a.id == agent.id);
    } else {
      selectedAgents.add(agent);
    }

    state = MyPropertyRefresh();
  }
}
