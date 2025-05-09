import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/helper.dart';
import 'app_text.dart';

void toast({required String msg, bool isError = true}) {
  BotToast.showCustomText(
      duration: const Duration(seconds: 2),
      toastBuilder: (cancelFunc) => Align(
            alignment: const Alignment(0, 0.8),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: AppColor.whiteFFFFFF,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isError
                              ? Colors.red.withValues(alpha: 0.2)
                              : Colors.green.withValues(alpha: 0.2),
                        ),
                        child: Icon(
                          isError ? Icons.error : Icons.done_all,
                          color: isError ? Colors.red : Colors.green,
                        ),
                      ),
                      xWidth(10),
                      Flexible(
                        child: AppText(
                          text: msg.tr(),
                          textAlign: TextAlign.center,
                          textSize: 15.sp,
                          fontFamily: AppFonts.satoshiBold,
                          color: isError ? Colors.red : Colors.green,
                        ),
                      ),
                      xWidth(10),
                    ],
                  ),
                ],
              ),
            ),
          ));
}
