import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/repositories/customer_property_repo_implementation.dart';

import '../states/my_property_states.dart';

class MyPropertyNotifier extends StateNotifier<MyPropertyState> {
  final CustomerPropertyRepository customerPropertyRepo;

  TextEditingController propertyTitleController = TextEditingController();
  TextEditingController propertyPriceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController propertyTypeController = TextEditingController();
  TextEditingController bathroomSizeController = TextEditingController();
  TextEditingController bedroomSizeController = TextEditingController();
  TextEditingController commissionPercentageController =
      TextEditingController();
  TextEditingController otherPropertyFeatureController =
      TextEditingController();
  List<File> imageFiles = [];
  MyPropertyNotifier({required this.customerPropertyRepo})
      : super(MyPropertyInitial());

  void addImage(File image) {
    imageFiles = [...imageFiles, image];
    _updateState();
  }

  void removeImage(File image) {
    imageFiles = imageFiles.where((img) => img != image).toList();
    _updateState();
  }

  void _updateState() {
    state = MyPropertyLoaded(images: imageFiles);
  }
}
