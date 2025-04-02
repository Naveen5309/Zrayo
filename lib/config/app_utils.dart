import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_bottom_sheet.dart';

import '../feature/z_common_widgets/custom_toast.dart';
import 'helper.dart';

class Utils {
  Utils._();

  static Future<MultipartFile> makeMultipartFile(String imagePath) async {
    String fileType = imagePath.substring(imagePath.lastIndexOf(".") + 1);
    return await MultipartFile.fromFile(imagePath,
        filename: imagePath.split("/").last,
        contentType: MediaType(getFileType(imagePath)!, fileType));
  }

  static String? getFileType(String path) {
    final mimeType = lookupMimeType(path);
    String? result = mimeType?.substring(0, mimeType.indexOf('/'));
    return result;
  }

  static BoxDecoration boxDecoWithShadow({double? borderRadius, Color? color}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius ?? 14),
      color: color ?? AppColor.whiteFFFFFF,
      boxShadow: [
        BoxShadow(
          color: AppColor.black232323.withValues(alpha: 0.1),
          blurRadius: 1,
          spreadRadius: 1,
        ),
      ],
    );
  }

  static double cardWidth(BuildContext context) => screenWidth(context) / 3.2;

  static double cardHeight(BuildContext context) =>
      screenHeight(context) / 3.75;

  static Future<bool> hasNetwork({bool? showToast}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.isEmpty ||
        connectivityResult.first == ConnectivityResult.none) {
      toast(msg: "Please check your Internet Connection", isError: true);
      return false;
    } else {
      return true;
    }
  }

  static bool emailValidation(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  static Future<void> showLoader() async {
    BotToast.cleanAll();
    BotToast.showCustomLoading(
        useSafeArea: true,
        allowClick: false,
        clickClose: false,
        ignoreContentClick: true,
        align: Alignment.center,
        toastBuilder: (void Function() cancelFunc) {
          return const SizedBox();
          //Lottie.asset(Assets.appLoading,height: 180.h);
        });
  }

  static void hideLoader() {
    BotToast.closeAllLoading();
  }

  static void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// used to return the type.
  static Future<void> appBottomSheet({
    required BuildContext context,
    required Widget widget,
    MainAxisSize? mainSize,
    bool isScrolled = true,
    bool barOnTop = true,
    bool isDismissible = true,
  }) async {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      constraints: BoxConstraints(maxHeight: screenHeight(context) / 1.2),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18.sp),
          topLeft: Radius.circular(18.sp),
        ),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      useSafeArea: false,
      isScrollControlled: isScrolled,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: CustomBottomSheet(
            content: widget,
            barOnTop: barOnTop,
            mainAxisSize: mainSize ?? MainAxisSize.min,
          ),
        );
      },
    );
  }
}
