import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/validator.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

import '../../../data/repositories/auth_repo_implementation.dart';
import '../states/create_profile_states.dart';

class CreateProfileNotifiers extends StateNotifier<CreateProfileStates> {
  final AuthRepository authRepo;
  final Validator validator = Validator.instance;

  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ninNumberController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final accountHolderController = TextEditingController();
  final accountNumberController = TextEditingController();
  final rountingNumberController = TextEditingController();

  CreateProfileNotifiers({required this.authRepo})
      : super(CreateProfileInitial());

  void createProfileValidator(BuildContext context) {
    final isValid = validator.createProfileValidator(
        phoneNumber: phoneController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        dob: dobController.text,
        ninNumber: ninNumberController.text);
    if (isValid) {
      createProfile();
    } else {
      toast(msg: validator.error);
    }
  }

  Future<void> createProfile() async {
    state = CreateProfileApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const CreateProfileFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "first_name": "abc",
        "last_name": "abc",
        "mobile_number": "Pass@123",
        "dob": "12/11/2000",
        "nin_number": "231",
        "device_type": "android",
        "device_token": "No Token",
      };
      final result = await authRepo.createProfile(body: body);
      state = result.fold((error) {
        return CreateProfileFailed(error: error.message);
      }, (result) {
        return CreateProfileSuccess();
      });
    } catch (e) {
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
}
