import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'extensions.dart';

part '../config/app_colors.dart';

part '../config/app_strings.dart';

void exit() {
  SystemNavigator.pop();
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double safeAreaHeight(BuildContext context) {
  return (MediaQuery.of(context)
          .padding
          .top) /*+
          MediaQuery.of(context).padding.bottom)*/
      +
      15;
}

Widget dividerVirtical({
  double height = 25,
  double width = 1,
  Color color = const Color(0xff100301),
}) {
  return Container(
    height: height,
    width: width,
    color: color,
  );
}

void unFocus(BuildContext context) {
  FocusScope.of(context).unfocus();
}

SizedBox yHeight(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox xWidth(double width) {
  return SizedBox(
    width: width,
  );
}

void offAllNamed(BuildContext context, String routesName) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routesName,
    (Route<dynamic> route) => false,
  );
}

void toNamed(BuildContext context, String routesName, {Object? args}) {
  Navigator.pushNamed(context, routesName, arguments: args,);
}

void back(BuildContext context) {
  Navigator.pop(context);
}

void printLog(dynamic msg, {String fun = ""}) {
  _printLog(' $fun=> ${msg.toString()}');
}

void functionLog({required dynamic msg, required dynamic fun}) {
  _printLog("${fun.toString()} ::==> ${msg.toString()}");
}

void _printLog(dynamic msg, {String name = "Riverpod"}) {
  if (kDebugMode) {
    log(msg.toString(), name: name);
  }
}

void blocLog({required String msg, required String bloc}) {
  _printLog("${bloc.toString()} ::==> ${msg.toString()}");
}
