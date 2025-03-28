import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/add_bank_details_provider.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class AddBankDetail extends ConsumerWidget {
  final bool fromSettings;

  const AddBankDetail({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addBankDetailsNotifier = ref.read(addBankDetailsProvider.notifier);
    ref.watch(addBankDetailsProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                  title: fromSettings
                      ? AppString.bankDetails
                      : AppString.addBankDetail),
              yHeight(10.sp),
              Container(
                height: 5,
                color: AppColor.orangeFff9f0,
                width: screenWidth(context),
                child: fromSettings
                    ? SizedBox()
                    : Row(
                        children: [
                          Container(
                            height: 5,
                            width: (screenWidth(context) / 5) * 4,
                            color: AppColor.primary,
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      spacing: 10.sp,
                      children: [
                        yHeight(0),
                        CustomTextField(
                          controller:
                              addBankDetailsNotifier.accountHolderController,
                          labelText: AppString.accountHolderName,
                          keyboardType: TextInputType.name,
                          hintText: AppString.enterAccountHolderName,
                        ),
                        CustomTextField(
                          controller:
                              addBankDetailsNotifier.accountNumberController,
                          labelText: AppString.accountNumber,
                          keyboardType: TextInputType.number,
                          hintText: AppString.enterAccountNumber,
                        ),
                        CustomTextField(
                          controller:
                              addBankDetailsNotifier.rountingNumberController,
                          labelText: AppString.routingNumber,
                          keyboardType: TextInputType.number,
                          hintText: AppString.enterRoutingNumber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!fromSettings)
                yHeight(context.height / 5)
              else
                yHeight(context.height / 3.5),
              CommonAppBtn(
                title:
                    fromSettings ? AppString.update : AppString.saveAndContinue,
                margin: const EdgeInsets.all(16),
                onTap: () {
                  if (!fromSettings) {
                    if (Getters.isAgent()) {
                      offAllNamed(context, Routes.dashboard);
                    } else {
                      // addBankDetailsNotifier.addBankDetailsValidator(context);
                      toNamed(context, Routes.subscriptionPlanView);
                    }
                  } else {
                    back(context);
                  }
                },
              ),
              if (!fromSettings)
                CommonAppBtn(
                  title: AppString.skip,
                  margin:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  borderColor: AppColor.transparent,
                  backGroundColor: AppColor.secondry,
                  textColor: AppColor.primary,
                  onTap: () {
                    // toNamed(context, Routes.subscriptionPlanView);)
                    if (Getters.isAgent()) {
                      offAllNamed(context, Routes.dashboard);
                    } else {
                      // addBankDetailsNotifier.addBankDetailsValidator(context);

                      toNamed(context, Routes.subscriptionPlanView);
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
