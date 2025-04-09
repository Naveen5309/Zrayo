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
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

import '../../../data/models/country_state_city_model.dart';
import '../../../data/repositories/auth_repo_implementation.dart';
import '../states/create_profile_states.dart';

class CreateProfileNotifiers extends StateNotifier<CreateProfileStates> {
  final AuthRepository authRepo;
  final Validator validator = Validator.instance;

  /// Variables for holding user profile-related data
  File? pickedImage;
  String? profileImageUrl;
  File uploadDocFrontFile = File("");
  File uploadDocBackFile = File("");
  UserModel? userModel;

  ///create update profile view fields
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ninNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  /// address view fields
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  /// bank view fields
  TextEditingController accountHolderController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController routingNumberController = TextEditingController();

  /// Lists to hold country, state, and city data
  List<Country> countries = <Country>[];
  List<StateModel> allStates = <StateModel>[];
  List<City> cities = <City>[];

  /// Filters for states and cities based on selection
  List<StateModel> filteredStates = <StateModel>[];
  List<City> filteredCities = <City>[];

  /// Constructor that initializes the class with an AuthRepository instance and loads countries, states, and cities
  CreateProfileNotifiers({required this.authRepo})
      : super(CreateProfileInitial()) {
    getProfile(isRefresh: true);
    loadCountriesFromAssets();
    loadStatesFromAssets();
    loadCitiesFromAssets();
  }

  /// Method to change the profile image
  void changeProfileImage(CroppedFile value) {
    pickedImage = File(value.path);
    state = CreateProfileRefresh();
  }

  /// Method to change the front document image
  void changeUploadFrontImage(CroppedFile value) {
    uploadDocFrontFile = File(value.path);
    state = CreateProfileRefresh();
  }

  // Method to change the back document image
  void changeUploadBackImage(CroppedFile value) {
    uploadDocBackFile = File(value.path);
    state = CreateProfileRefresh();
  }

  Future<bool?> getProfile({bool isRefresh = false}) async {
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return false;
      }

      final result = await authRepo.getProfile();
      result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        userModel = result;

        if (isRefresh) {
          state = CreateProfileRefresh();
        } else {
          setValueInControllers(userData: userModel);
          return true;
        }
      });
    } catch (e) {
      state = CreateProfileFailed(error: e.toString());
    }
    return false;
  }

  /// Method to validate profile data and either create or update the profile
  void createProfileValidator(BuildContext context, {bool? isUpdateCall}) {
    final isValid = validator.createProfileValidator(
        phoneNumber: phoneController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        dob: dobController.text,
        ninNumber: ninNumberController.text);
    if (isValid) {
      createUpdateProfile(isUpdateCall: isUpdateCall);
    } else {
      toast(msg: validator.error);
    }
  }

  /// Method to create or update the profile by calling the AuthRepository
  Future<void> createUpdateProfile({bool? isUpdateCall}) async {
    state = CreateProfileApiLoading(route: Routes.createProfile);
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      DateFormat originalFormat = DateFormat('dd/MM/yyyy');
      DateTime date = originalFormat.parse(dobController.text);
      DateFormat targetFormat = DateFormat('yyyy/MM/dd');
      String formattedDate = targetFormat.format(date); // Format DOB

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

      /// Call repository method to create or update the profile
      final result = await authRepo.createUpdateProfile(
          body: map, isUpdateCall: isUpdateCall ?? false);
      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileApiLoading(route: Routes.createProfile);
      });
      if (state is! CreateProfileFailed) {
        await getProfile();
        state = CreateProfileSuccess();
      }
    } catch (e, t) {
      functionLog(msg: t.toString(), fun: "createUpdateProfile");
      state = CreateProfileFailed(error: e.toString());
    }
  }

  /// Method to validate and add the address
  void addAddressValidator(bool fromSettings) {
    final isValid = validator.addAddressValidator(
      address: addressController.text.trim(),
      city: cityController.text.trim(),
      state: stateController.text.trim(),
      country: countryController.text.trim(),
    );
    if (isValid) {
      addAddress(fromSettings);
    } else {
      toast(msg: validator.error);
    }
  }

  /// Method to add the address by calling the AuthRepository
  Future<void> addAddress(bool fromSettings) async {
    state = CreateProfileApiLoading(route: Routes.addAddressView);
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      Map<String, dynamic> body = {
        "address": addressController.text,
        "city": cityController.text,
        "state": stateController.text,
        "country": countryController.text,
        "zipcode": "10001",
        "latitude": 40.712776,
        "longitude": -74.005974
      };

      final result =
          await authRepo.addAddress(body: body, isUpdate: fromSettings);

      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileApiLoading(route: Routes.addAddressView);
      });
      if (state is! CreateProfileFailed) {
        await getProfile();
        state = AddressSuccess();
      }
    } catch (e) {
      state = CreateProfileFailed(error: e.toString());
    }
  }

  /// Method to validate and add bank details
  void addBankDetailsValidator(BuildContext context) {
    final isValid = validator.addBankDetailsValidator(
      accountHolder: accountHolderController.text.trim(),
      accountNumber: accountNumberController.text.trim(),
      routingNumber: routingNumberController.text.trim(),
    );
    if (isValid) {
      addBankDetails();
    } else {
      toast(msg: validator.error);
    }
  }

  /// Method to add bank details by calling the AuthRepository
  Future<void> addBankDetails() async {
    state = CreateProfileApiLoading(route: Routes.addBankDetail);
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      Map<String, dynamic> body = {
        "bankHolderName": accountHolderController.text,
        "bankAccountNumber": accountNumberController.text,
        "bankRoutingNumber": routingNumberController.text,
      };

      final result = await authRepo.bankDetails(body: body);
      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileApiLoading(route: Routes.addBankDetail);
      });
      if (state is! CreateProfileFailed) {
        await getProfile();
        state = BankSuccess();
      }
    } catch (e) {
      state = CreateProfileFailed(error: e.toString());
    }
  }

  /// Method to load country data from assets
  Future<void> loadCountriesFromAssets() async {
    String jsonString = await rootBundle.loadString(Assets.countryJson);
    List<dynamic> jsonList = json.decode(jsonString);
    countries = parseCountries(jsonList);
    state = CreateProfileRefresh();
  }

  /// Method to load state data from assets
  Future<void> loadStatesFromAssets() async {
    String jsonString = await rootBundle.loadString(Assets.stateJson);
    List<dynamic> jsonList = json.decode(jsonString);
    allStates = parseStates(jsonList);
    state = CreateProfileRefresh();
  }

  /// Method to load city data from assets
  Future<void> loadCitiesFromAssets() async {
    String jsonString = await rootBundle.loadString(Assets.cityJson);
    List<dynamic> jsonList = json.decode(jsonString);
    cities = parseCities(jsonList);
    state = CreateProfileRefresh();
  }

  /// Helper method to parse country data
  List<Country> parseCountries(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json)).toList();
  }

  /// Helper method to parse state data
  List<StateModel> parseStates(List<dynamic> jsonList) {
    return jsonList.map((json) => StateModel.fromJson(json)).toList();
  }

  /// Helper method to parse city data
  List<City> parseCities(List<dynamic> jsonList) {
    return jsonList.map((json) => City.fromJson(json)).toList();
  }

  /// Method to select a country and filter states based on the selected country
  void selectCountry(String countryName) {
    final selectedCountry = countries.firstWhere((c) => c.name == countryName);
    countryController.text = selectedCountry.name;

    filteredStates = allStates
        .where((state) =>
            int.tryParse(state.countryId) == int.tryParse(selectedCountry.id))
        .toList();

    stateController.clear();
    cityController.clear();
    filteredCities = [];
    state = CreateProfileRefresh();
  }

  /// Method to select a state and filter cities based on the selected state
  void selectState(String stateName) {
    final selectedState = filteredStates.firstWhere((s) => s.name == stateName);
    stateController.text = selectedState.name;

    filteredCities = cities
        .where((city) =>
            int.tryParse(city.stateId) == int.tryParse(selectedState.id))
        .toList();

    cityController.clear();
    state = CreateProfileRefresh();
  }

  void uploadDocumentValidator() {
    if (((uploadDocBackFile.path.isNotEmpty)) ||
        ((uploadDocFrontFile.path.isNotEmpty))) {
      uploadDocument();
    } else {
      toast(msg: "Please upload document");
    }
  }

  /// Method to upload documents by calling the AuthRepository
  Future<void> uploadDocument() async {
    state = CreateProfileApiLoading(route: Routes.uploadDocument);
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      final result = await authRepo.uploadDocument(
        backSide: uploadDocBackFile,
        frontSide: uploadDocFrontFile,
      );
      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileApiLoading(route: Routes.uploadDocument);
      });
      if (state is! CreateProfileFailed) {
        await getProfile();
        state = UploadDocSuccess();
      }
    } catch (e, t) {
      functionLog(msg: t.toString(), fun: "uploadDocument");
      state = CreateProfileFailed(error: e.toString());
    }
  }

  /// Method to set initial values in text controllers based on local storage data
  void setValueInControllers({UserModel? userData}) {
    final userModel = userData ?? Getters.getLocalStorage.getLoginUser();
    profileImageUrl =
        "${ApiEndpoints.profileImageUrl}${userModel?.userProfile}";
    phoneController.text = userModel?.phoneNumber ?? "";
    firstNameController.text = userModel?.firstName?.toTitleCase() ?? "";
    lastNameController.text = userModel?.lastName?.toTitleCase() ?? "";
    ninNumberController.text = userModel?.ninOrBvnNumber ?? "";
    dobController.text = userModel?.dob != null
        ? formatDOBDDMMYYYY(userModel?.dob ?? DateTime.now())
        : "";
    addressController.text = userModel?.detail?.address ?? "";
    cityController.text = userModel?.detail?.city ?? "";
    stateController.text = userModel?.detail?.state ?? "";
    countryController.text = userModel?.detail?.country ?? "";
    countryController.text = userModel?.detail?.country ?? "";
    uploadDocFrontFile = File("");
    uploadDocBackFile = File("");
    accountHolderController = TextEditingController();
    accountNumberController = TextEditingController();
    routingNumberController = TextEditingController();
    state = CreateProfileRefresh();
  }

  clearValues() {
    profileImageUrl = null;
    phoneController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    ninNumberController = TextEditingController();
    dobController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
    accountHolderController = TextEditingController();
    accountNumberController = TextEditingController();
    routingNumberController = TextEditingController();
    uploadDocFrontFile = File("");
    pickedImage = null;
    uploadDocBackFile = File("");
  }
}
