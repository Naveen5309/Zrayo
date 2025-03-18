import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/create_profile_steps/upload_document_tile.dart';

import '../../../../../config/helper.dart';
import '../../../../common_widgets/common_dotted_border.dart';
import '../../../../common_widgets/custom_app_bar.dart';
import '../../../../common_widgets/custom_btn.dart';

class AddPaymentCard extends StatelessWidget {
  const AddPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: AppString.addCardDetail),
            yHeight(10.sp),
            Container(
              height: 5,
              color: AppColor.orangeFff9f0,
              width: screenWidth(context),
              child: Row(
                children: [
                  Container(
                    height: 5,
                    width: (screenWidth(context) / 5) * 5,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    yHeight(40.sp),
                    CommonDottedBorder(
                      child: UploadDocumentTile(
                        iconWidget: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.secondry,
                          ),
                          child: Icon(CupertinoIcons.plus),
                        ),
                        filePath: "",
                        title: AppString.linkYourCardWithUs,
                        subTitle: "",
                        onTap: () {},
                      ),
                    ),
                    Spacer(),
                    CommonAppBtn(
                      title: AppString.saveAndContinue,
                      // onTap: () => toNamed(context, Routes.addBankDetail),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
