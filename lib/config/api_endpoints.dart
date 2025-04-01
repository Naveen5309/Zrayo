part of '../core/network/http_service.dart';

abstract final class ApiConstants {
  static const String url = "https://manish.parastechnologies.in/zrayo";
  static const String baseUrl = "$url/api/v1";
  static const String login = "users/login";
  static const String signUp = "signUp";
  static const String addAddress = "addAddress";
  static const String addBankDetails = "addBankDetails";
  static const String forgetPassword = "forgetPassword";
  static const String verifyEmail = "verifyEmail";
  static const String changePassword = "changePassword";
  static const String contactUs = "contactUs";
  static const String createProfile = "createProfile";
  static const String preferences = "get/preferences";
}
