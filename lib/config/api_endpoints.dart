part of '../core/network/http_service.dart';

abstract final class ApiConstants {
  static const String url = "https://manish.parastechnologies.in/zrayo";
  static const String baseUrl = "$url/api/v1";
  static const String login = "users/login";
  static const String signUp = "users/register";
  static const String addAddress = "addAddress";
  static const String addBankDetails = "addBankDetails";
  static const String forgetPassword = "users/forgot/password/mail";
  static const String verifyEmail = "users/verify/otp";
  static const String changePassword = "users/reset/password";
  static const String contactUs = "contactUs";
  static const String createProfile = "users/profile/create";
  static const String logout = "users/logout";
}
