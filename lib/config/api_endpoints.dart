part of '../core/network/http_service.dart';

abstract final class ApiConstants {
  static const String url = "https://api.autoexpertstx.com";
  static const String baseUrl = "$url/api/v1";
  static const String login = "$baseUrl/login";
  static const String signUp = "$baseUrl/signUp";
  static const String addAddress = "$baseUrl/addAddress";
  static const String addBankDetails = "$baseUrl/addBankDetails";
  static const String forgetPassword = "$baseUrl/forgetPassword";
  static const String verifyEmail = "$baseUrl/verifyEmail";
  static const String changePassword = "$baseUrl/changePassword";
  static const String contactUs = "$baseUrl/contactUs";
  static const String createProfile = "$baseUrl/createProfile";
  static const String preferences = "$baseUrl/get/preferences";
}
