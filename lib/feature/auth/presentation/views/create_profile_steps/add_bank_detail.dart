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
            CustomAppBar(title: "Add Bank Detail"),
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
                          CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.calling),
                            labelText: "Account Holder Name",
                            keyboardType: TextInputType.name,
                            hintText: "Enter account holder name",
                          ),
                          CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.cake),
                            labelText: "Account Number",
                            keyboardType: TextInputType.number,
                            hintText: "Enter account number",
                          ),
                          CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.cake),
                            labelText: "Routing Number",
                            keyboardType: TextInputType.number,
                            hintText: "Enter routing number",
                          ),
                        ],
                      ),
                      yHeight(60.sp),
                      CommonAppBtn(
                        title: AppString.saveAndContinue,
                        onTap: () => toNamed(context, Routes.addAddressView),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
