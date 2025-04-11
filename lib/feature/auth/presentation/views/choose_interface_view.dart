import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

import '../../../../core/helpers/all_getter.dart';

class ChooseInterfaceView extends StatelessWidget {
  const ChooseInterfaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.chooseRole), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 20.sp,
          children: [
            AppText(
              text: AppString.chooseInterface.tr(),
              textSize: 24.sp,
              fontFamily: AppFonts.satoshiBold,
            ),
            AppText(
              text: AppString.logInAsACustomerToFindProperties.tr(),
              fontFamily: AppFonts.satoshiRegular,
              textAlign: TextAlign.center,
              lineHeight: 1.2,
            ),
            yHeight(0),
            CommonAppBtn(
              title: AppString.customer.tr(),
              onTap: () {
                Getters.getLocalStorage.saveUserType(UserTypeEnum.customer);
                toNamed(context, Routes.loginView);
              },
            ),
            CommonAppBtn(
              title: AppString.agent.tr(),
              borderColor: AppColor.transparent,
              backGroundColor: AppColor.secondry,
              textColor: AppColor.primary,
              onTap: () {
                Getters.getLocalStorage.saveUserType(UserTypeEnum.agent);
                toNamed(context, Routes.loginView);
              },
            ),
            yHeight(15.sp),
          ],
        ),
      ),
    );
  }
}
