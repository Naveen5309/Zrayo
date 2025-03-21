import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class BankDetailsView extends StatelessWidget {
  const BankDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(title: AppString.bankDetails),
              yHeight(10.sp),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      spacing: 10.sp,
                      children: [
                        yHeight(8),
                        CustomTextField(
                          labelText: AppString.accountHolderName,
                          keyboardType: TextInputType.name,
                          hintText: AppString.enterAccountHolderName,
                        ),
                        CustomTextField(
                          labelText: AppString.accountNumber,
                          keyboardType: TextInputType.number,
                          hintText: AppString.enterAccountNumber,
                        ),
                        CustomTextField(
                          labelText: AppString.routingNumber,
                          keyboardType: TextInputType.number,
                          hintText: AppString.enterRoutingNumber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              yHeight(context.height / 2.6),
              CommonAppBtn(
                title: AppString.update,
                margin: const EdgeInsets.all(16),
                onTap: () => back(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
