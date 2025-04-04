import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/config/validator.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

import '../../../../../config/helper.dart';
import '../../../data/models/country_state_city_model.dart';
import '../../../data/repositories/auth_repo_implementation.dart';
import '../states/create_profile_states.dart';

class CreateProfileNotifiers extends StateNotifier<CreateProfileStates> {
  final AuthRepository authRepo;
  final Validator validator = Validator.instance;

  File? pickedImage;
  String? profileImageUrl;
  File? uploadDocFrontFile;
  File? uploadDocBackFile;
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ninNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController accountHolderController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController rountingNumberController = TextEditingController();

  List<Country> countries = <Country>[];
  List<StateModel> allStates = <StateModel>[];
  List<City> cities = <City>[];
  int? selectedCountryId;
  int? selectedStateId;

  CreateProfileNotifiers({required this.authRepo})
      : super(CreateProfileInitial()) {
    setValueInControllers();
    loadCountriesFromAssets();
    loadStatesFromAssets();
    loadCitiesFromAssets();
  }

  void changeProfileImage(CroppedFile value) {
    pickedImage = File(value.path);
    state = CreateProfileRefresh();
  }

  void createProfileValidator(BuildContext context) {
    final isValid = validator.createProfileValidator(
        phoneNumber: phoneController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        dob: dobController.text,
        ninNumber: ninNumberController.text);
    if (isValid) {
      createUpdateProfile();
    } else {
      toast(msg: validator.error);
    }
  }

  Future<void> createUpdateProfile({bool? isUpdateCall}) async {
    state = CreateProfileApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      DateFormat originalFormat = DateFormat('dd/MM/yyyy');
      DateTime date = originalFormat.parse(dobController.text);
      DateFormat targetFormat = DateFormat('yyyy/MM/dd');
      String formattedDate = targetFormat.format(date);
      Map<String, dynamic> body = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "phoneNumber": phoneController.text.trim(),
        "dob": formattedDate,
        "ninOrBvnNumber": ninNumberController.text.trim(),
      };
      Map<String, dynamic> map = {};
      map.addAll(body);
      if (pickedImage != null && (pickedImage?.path.isNotEmpty ?? false)) {
        map["image"] = await Utils.makeMultipartFile(pickedImage?.path ?? "");
      }
      final result = await authRepo.createUpdateProfile(
          body: map, isUpdateCall: isUpdateCall ?? false);
      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileSuccess();
      });
    } catch (e, t) {
      functionLog(msg: t.toString(), fun: "createUpdateProfile");

      state = CreateProfileFailed(error: e.toString());
    }
  }

  void addAddressValidator(BuildContext context) {
    final isValid = validator.addAddressValidator(
      address: addressController.text,
      city: cityController.text,
      state: stateController.text,
      country: countryController.text,
    );
    if (isValid) {
      addAddress();
    } else {
      toast(msg: validator.error);
    }
  }

  Future<void> addAddress() async {
    state = CreateProfileApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "address": "abc",
        "city": "abc",
        "state": "abc",
        "country": "abc",
      };
      final result = await authRepo.addAddress(body: body);
      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileSuccess();
      });
    } catch (e) {
      state = CreateProfileFailed(error: e.toString());
    }
  }

  void addBankDetailsValidator(BuildContext context) {
    final isValid = validator.addBankDetailsValidator(
      accountHolder: accountHolderController.text,
      accountNumber: accountNumberController.text,
      routingNumber: rountingNumberController.text,
    );
    if (isValid) {
      addBankDetails();
    } else {
      toast(msg: validator.error);
    }
  }

  Future<void> addBankDetails() async {
    state = CreateProfileApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "account_holder": "abc",
        "account_number": "abc",
        "rounting_number": "abc",
      };
      final result = await authRepo.addBankDetails(body: body);
      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileSuccess();
      });
    } catch (e) {
      state = CreateProfileFailed(error: e.toString());
    }
  }

  /// Load and parse the JSON data from the assets
  Future<void> loadCountriesFromAssets() async {
    String jsonString = await rootBundle.loadString(Assets.countryJson);
    List<dynamic> jsonList = json.decode(jsonString);
    countries = parseCountries(jsonList);
    state = CreateProfileRefresh();
  }

  Future<void> loadStatesFromAssets() async {
    String jsonString = await rootBundle.loadString(Assets.stateJson);
    printLog("jsonList=================>${jsonString}");

    List<dynamic> jsonList = json.decode(jsonString);
    allStates = parseStates(jsonList);
    printLog("allStates=================>${allStates}");
    state = CreateProfileRefresh();
  }

  Future<void> loadCitiesFromAssets() async {
    String jsonString = await rootBundle.loadString(Assets.cityJson);
    List<dynamic> jsonList = json.decode(jsonString);
    cities = parseCities(jsonList);

    state = CreateProfileRefresh();
  }

  /// Parsing methods
  List<Country> parseCountries(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json)).toList();
  }

  List<StateModel> parseStates(List<dynamic> jsonList) {
    return jsonList.map((json) => StateModel.fromJson(json)).toList();
  }

  List<City> parseCities(List<dynamic> jsonList) {
    return jsonList.map((json) => City.fromJson(json)).toList();
  }

  void selectCountry(String countryName) {
    final selectedCountry = countries.firstWhere((c) => c.name == countryName);
    selectedCountryId = int.tryParse(selectedCountry.id);
    countryController.text = selectedCountry.name;
    state = CreateProfileRefresh();
  }

  void selectState(String stateName) {
    final selectedState = allStates.firstWhere((s) => s.name == stateName);
    selectedStateId = int.tryParse(selectedState.id);
    stateController.text = selectedState.name;
    state = CreateProfileRefresh();
  }

  Future<void> uploadDocument() async {
    state = CreateProfileApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}

      final result = await authRepo.uploadDocument(
        backSide: uploadDocBackFile,
        frontSide: uploadDocFrontFile,
      );
      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileSuccess();
      });
    } catch (e, t) {
      functionLog(msg: t.toString(), fun: "uploadDocument");

      state = CreateProfileFailed(error: e.toString());
    }
  }

  void setValueInControllers() {
    final userModel = Getters.getLocalStorage.getLoginUser();
    profileImageUrl =
        "${ApiEndpoints.profileImageUrl}${userModel?.userProfile}";
    phoneController.text = userModel?.phoneNumber ?? "";
    firstNameController.text = userModel?.firstName?.toTitleCase() ?? "";
    lastNameController.text = userModel?.lastName?.toTitleCase() ?? "";
    ninNumberController.text = userModel?.ninOrBvnNumber ?? "";
    dobController.text = formatDOBDDMMYYYY(userModel?.dob ?? DateTime.now());
    addressController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
    accountHolderController = TextEditingController();
    accountNumberController = TextEditingController();
    rountingNumberController = TextEditingController();
    state = CreateProfileRefresh();
  }

  void changeUploadFrontImage(CroppedFile value) {
    uploadDocFrontFile = File(value.path);
    state = CreateProfileRefresh();
  }

  void changeUploadBackImage(CroppedFile value) {
    uploadDocBackFile = File(value.path);
    state = CreateProfileRefresh();
  }

}
