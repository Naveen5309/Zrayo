import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/network/http_service.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_agents_list_model.dart';
import 'package:zrayo_flutter/feature/my_properties/presentation/provider/my_property_provider.dart';
import 'package:zrayo_flutter/feature/my_properties/presentation/provider/state_notifiers/my_property_notifiers.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class AddPropertyAgentView extends ConsumerWidget {
  const AddPropertyAgentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPropertyAssignAgentNotifier = ref.read(myPropertyProvider.notifier);
    ref.watch(myPropertyProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: AppString.addProperty.tr()),
            yHeight(10.sp),
            Container(
              height: 5,
              color: AppColor.primary,
              width: screenWidth(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  yHeight(20.h),
                  AppText(
                    text: AppString.assignAgent.tr(),
                    textSize: 15.sp,
                    fontFamily: AppFonts.satoshiBold,
                  ),
                  yHeight(10),
                  Row(
                    children: [
                      _buildRadioButton(
                        label: AppString.yes.tr(),
                        context: context,
                        ref: ref,
                        value: 0,
                        myPropertyAssignAgentNotifier:
                            myPropertyAssignAgentNotifier,
                      ),
                      SizedBox(width: 20.w),
                      _buildRadioButton(
                        label: AppString.no.tr(),
                        context: context,
                        value: 1,
                        ref: ref,
                        myPropertyAssignAgentNotifier:
                            myPropertyAssignAgentNotifier,
                      ),
                    ],
                  ),
                  yHeight(10.h),
                  Wrap(
                    spacing: 14.0,
                    runSpacing: 12.0,
                    children: myPropertyAssignAgentNotifier.selectedAgents
                        .map((agent) {
                      return _buildUserChip(
                        '${agent.firstName} ${agent.lastName}',
                        "${ApiEndpoints.profileImageUrl}${agent.userProfile}",
                        agent,
                        myPropertyAssignAgentNotifier,
                      );
                    }).toList(),
                  ),
                  yHeight(20.h),
                  CustomTextField(
                    labelText: AppString.setCommissionPercentage.tr(),
                    hintText: AppString.enterPercentage.tr(),
                    controller: myPropertyAssignAgentNotifier
                        .commissionPercentageController,
                  ),
                  yHeight(context.height / 4.5),
                  CommonAppBtn(
                    title: AppString.next.tr(),
                    onTap: () {
                      toNamed(context, Routes.featurePrpertyView);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserChip(
      String name,
      String imageUrl,
      PropertyAgentsListsModel agent,
      MyPropertyNotifier myPropertyAssignAgentNotifier) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.color21203F.withValues(alpha: .04),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomCacheNetworkImage(
            img: imageUrl,
            size: 32,
          ),
          xWidth(8),
          Flexible(
            child: AppText(
              text: name.tr(),
              textSize: 14.sp,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          xWidth(8),
          GestureDetector(
              onTap: () {
                myPropertyAssignAgentNotifier.toggleAgentSelection(agent);
              },
              child: SvgPicture.asset(Assets.x)),
        ],
      ),
    );
  }

  Widget _buildRadioButton({
    required String label,
    required BuildContext context,
    required WidgetRef ref,
    required int value,
    required MyPropertyNotifier myPropertyAssignAgentNotifier,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: AppColor.colorB7B7B7,
      ),
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: myPropertyAssignAgentNotifier.assignAgent,
            activeColor: AppColor.primary,
            onChanged: (value) {
              myPropertyAssignAgentNotifier.assignAgentValue(value);

              if (value == 0) {
                Utils.appBottomSheet(
                    context: context,
                    widget: bottomSheet(
                      context: context,
                    ),
                    isScrolled: true);
              }
            },
          ),
          AppText(
            text: label.tr(),
            textSize: 14.sp,
            color: AppColor.black4A4A4A,
          ),
        ],
      ),
    );
  }

  Widget bottomSheet({required BuildContext context}) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final myPropertyAssignAgentNotifier =
            ref.read(myPropertyProvider.notifier);
        ref.watch(myPropertyProvider);

        return Container(
          constraints: BoxConstraints(maxHeight: screenHeight(context) / 1.5),
          child: Column(
            children: [
              yHeight(12),
              AppText(
                text: AppString.chooseAgents.tr(),
                textSize: 20.sp,
                fontFamily: AppFonts.satoshiBold,
              ),
              yHeight(12),
              AppText(
                text: AppString.slectAgent.tr(),
                fontFamily: AppFonts.satoshiRegular,
                // textSize: 13.sp,
                lineHeight: 1.2,
                textAlign: TextAlign.center,
                color: AppColor.black000000.withValues(alpha: 0.6),
              ),
              yHeight(16.h),
              CustomTextField(
                hintText: AppString.search,
                prefixIcon: SvgPicture.asset(Assets.searchIcon),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shrinkWrap: true,
                  itemCount:
                      myPropertyAssignAgentNotifier.propertyAgentsList!.length,
                  itemBuilder: (context, index) {
                    final agent = myPropertyAssignAgentNotifier
                        .propertyAgentsList?[index];
                    final isSelected =
                        myPropertyAssignAgentNotifier.selectedAgents.any(
                      (a) => a.id == agent?.id,
                    );

                    return Column(
                      children: [
                        ListTile(
                          minTileHeight: 8,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          leading: CustomCacheNetworkImage(
                            img:
                                "${ApiEndpoints.profileImageUrl}${agent?.userProfile}",
                            size: 50,
                          ),
                          title: AppText(
                            text:
                                '${agent?.firstName ?? ''} ${agent?.lastName ?? ''}',
                            textSize: 14.sp,
                            fontFamily: AppFonts.satoshiBold,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AppText(
                              text: agent?.phoneNumber ?? "",
                              textSize: 12.sp,
                              fontFamily: AppFonts.satoshiRegular,
                              color:
                                  AppColor.color212121.withValues(alpha: 0.5),
                            ),
                          ),
                          trailing: SvgPicture.asset(
                            isSelected ? Assets.lucideTrue : Assets.lucide,
                          ),
                          onTap: () {
                            myPropertyAssignAgentNotifier
                                .toggleAgentSelection(agent!);
                          },
                        ),
                        if (index != 9)
                          Divider(
                            color: AppColor.colorDDDDDD.withValues(alpha: .9),
                          ),
                      ],
                    );
                  },
                ),
              ),
              // yHeight(15),
              CommonAppBtn(
                title: AppString.continueText.tr(),
                onTap: () => back(context),
              )
            ],
          ),
        );
      },
    );
  }
}
