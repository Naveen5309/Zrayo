import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/enums.dart';

import '../states/search_states.dart';

class CustomerSideSearchNotifier
    extends StateNotifier<CustomerSideSearchState> {
  CustomerSideSearchNotifier() : super(CustomerSideSearchInitial());

  PropertyTypesEnum selectedPropertyType = PropertyTypesEnum.rentalApartment;
  int priceRange = 5000;
  List<Map<String, dynamic>> propertyTypeList = [
    {
      "title": "Short Term Rental Apartment",
      "icon": Assets.propertyRentalApartment1,
      "type": PropertyTypesEnum.rentalApartment
    },
    {
      "title": "House",
      "icon": Assets.propertyHouseIcon,
      "type": PropertyTypesEnum.house
    },
    {
      "title": "Building",
      "icon": Assets.propertyBuildingIcon,
      "type": PropertyTypesEnum.building
    },
    {
      "title": "Land",
      "icon": Assets.propertyLandIcon,
      "type": PropertyTypesEnum.land
    },
    {
      "title": "Parking Space",
      "icon": Assets.propertyCar,
      "type": PropertyTypesEnum.parkingSpace
    },
  ];

  void changePropertyType(PropertyTypesEnum type) {
    selectedPropertyType = type;
    state = CustomerSideSearchPageRefresh();
  }

  void updatePriceRange(value) {
    priceRange = value;
    state = CustomerSideSearchPageRefresh();
  }
}
