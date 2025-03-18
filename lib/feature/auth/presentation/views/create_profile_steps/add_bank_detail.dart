import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_text_field.dart';

import '../../../../../config/assets.dart';

class AddBankDetail extends StatelessWidget {
  const AddBankDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: AppString.addBankDetail),
            yHeight(10.sp),
            Container(
              height: 5,
              color: AppColor.orangeFff9f0,
              width: screenWidth(context),
              child: Row(
                children: [
                  Container(
                    height: 5,
                    width: (screenWidth(context) / 5) * 4,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Column(
                        spacing: 10.sp,
                        children: [
                          yHeight(0),
                          CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.calling),
                            labelText: AppString.accountHolderName,
                            keyboardType: TextInputType.name,
                            hintText: AppString.enterAccountHolderName,
                          ),
                          CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.cake),
                            labelText: AppString.accountNumber,
                            keyboardType: TextInputType.number,
                            hintText: AppString.enterAccountNumber,
                          ),
                          CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.cake),
                            labelText: AppString.routingNumber,
                            keyboardType: TextInputType.number,
                            hintText: AppString.enterRoutingNumber,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            CommonAppBtn(
              title: AppString.saveAndContinue,
              margin: const EdgeInsets.all(16),
              onTap: () => toNamed(context, Routes.addPaymentCard),
            ),
          ],
        ),
      ),
    );
  }
}
