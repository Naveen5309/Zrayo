part of '../core/network/http_service.dart';

abstract final class ApiEndpoints {
  static const String url = "https://manish.parastechnologies.in/zrayo";
  static const String profileImageUrl = "$url/storage/app/public/users/";
  static const String docImageUrl = "$url/storage/app/public/documents/";
  static const String baseUrl = "$url/api/v1";
  static const String login = "users/login";
  static const String userDetail = "users/detail";
  static const String signUp = "users/register";
  static const String addAddress = "users/address/add";
  static const String updateAddress = "users/address/update";
  static const String addBankDetails = "users/bank/add";
  static const String forgetPassword = "users/forgot/password/mail";
  static const String verifyEmail = "users/verify/otp";
  static const String changePassword = "users/reset/password";
  static const String contactUs = "home/contactus";
  static const String createProfile = "users/profile/create";
  static const String updateProfile = "users/profile/update";
  static const String logout = "users/logout";
  static const String uploadFile = "home/upload/file";
  static const String addDocument = "users/document/add";
  static const String resendOtp = "users/resend/otp";
  static const String aboutUs = "home/page";
  static const String images = "home/property/images/upload";
  static const String changeNotificationSettings =
      "users/notification/settings";
  static const String propertyTypesAndFeatures = "home/property/types";
  static const String propertyAgentsList = "home/property/agents";
  static const String addPropertyAgents = "home/property/agents/add";
  static const String propertyAdd = "home/property/add";
}
