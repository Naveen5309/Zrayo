import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_type_model.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/repositories/customer_property_repo_implementation.dart';

import '../states/my_property_states.dart';

class MyPropertyNotifier extends StateNotifier<MyPropertyState> {
  final CustomerPropertyRepository customerPropertyRepo;

  MyPropertyNotifier({required this.customerPropertyRepo})
      : super(MyPropertyInitial()) {
    getPropertyTypesAndFeatures();
  }

  List<PropertyTypeAndFeaturesModel>? propertyTypesAndFeatures =
      <PropertyTypeAndFeaturesModel>[];
  PropertyTypeAndFeaturesModel? selectedPropertyType;
  List<PropertyTypeAndFeaturesModel>? selectedPropertyFeatures =
      <PropertyTypeAndFeaturesModel>[];
  PropertyListingType? sellOrRentType;
  TextEditingController? otherFeature = TextEditingController();
  TextEditingController? bathroomSize = TextEditingController();
  TextEditingController? bedroomSize = TextEditingController();

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
}
