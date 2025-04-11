import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/create_profile_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/create_profile_states.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class AddBankDetail extends ConsumerWidget {
  final bool fromSettings;

  const AddBankDetail({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addBankDetailsNotifier = ref.read(createProfileProvider.notifier);
    final createProfileState = ref.watch(createProfileProvider);
    ref.listen<CreateProfileStates>(createProfileProvider, (previous, next) {
      if (next is BankSuccess) {
        if (!fromSettings) {
          if (Getters.isAgent()) {
            offAllNamed(context, Routes.dashboard);
          } else {
            toNamed(context, Routes.subscriptionPlanView);
          }
        } else {
          back(context);
        }
      } else if (next is CreateProfileFailed) {
        toast(msg: next.error, isError: true);
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
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
                        labelText: AppString.accountHolderName.tr(),
                        keyboardType: TextInputType.name,
                        hintText: AppString.enterAccountHolderName.tr(),
                      ),
                      CustomTextField(
                        controller:
                            addBankDetailsNotifier.accountNumberController,
                        labelText: AppString.accountNumber.tr(),
                        keyboardType: TextInputType.number,
                        hintText: AppString.enterAccountNumber.tr(),
                      ),
                      CustomTextField(
                        controller:
                            addBankDetailsNotifier.routingNumberController,
                        labelText: AppString.routingNumber.tr(),
                        keyboardType: TextInputType.number,
                        hintText: AppString.enterRoutingNumber.tr(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (!fromSettings)
              yHeight(context.height / 5)
            else
              yHeight(context.height / 2.5),
            CommonAppBtn(
              title: fromSettings
                  ? AppString.update.tr()
                  : AppString.saveAndContinue.tr(),
              margin: const EdgeInsets.all(16),
              loading: createProfileState is CreateProfileApiLoading &&
                  createProfileState.route == Routes.addBankDetail,
              onTap: () {
                addBankDetailsNotifier.addBankDetailsValidator(context);
              },
            ),
            if (!fromSettings && !Getters.isAgent())
              CommonAppBtn(
                  title: AppString.skip.tr(),
                  margin:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  borderColor: AppColor.transparent,
                  backGroundColor: AppColor.secondry,
                  textColor: AppColor.primary,
                  onTap: () {
                    toNamed(context, Routes.subscriptionPlanView);
                  }),
          ],
        ),
      ),
    );
  }
}
