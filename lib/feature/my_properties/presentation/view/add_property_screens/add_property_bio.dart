import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/my_properties/presentation/provider/my_property_provider.dart';
import 'package:zrayo_flutter/feature/my_properties/presentation/provider/states/my_property_states.dart';
import 'package:zrayo_flutter/feature/my_properties/presentation/view/add_property_screens/custom_add_widget.dart';
import 'package:zrayo_flutter/feature/my_properties/presentation/view/add_property_screens/custom_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/camera_bottom_sheet_view.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_drop_down.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class AddPropertyBioView extends ConsumerWidget {
  const AddPropertyBioView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPropertyNotifier = ref.read(myPropertyProvider.notifier);
    final myPropertyState = ref.watch(myPropertyProvider);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      CustomAppBar(title: AppString.addProperty.tr()),
      yHeight(10.sp),
      Container(
        height: 5,
        color: AppColor.orangeFff9f0,
        width: screenWidth(context),
        child: Row(
          children: [
            Container(
              height: 5,
              width: (screenWidth(context) / 5) * 1.6,
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
                  labelText: AppString.tittle.tr(),
                  keyboardType: TextInputType.name,
                  controller: myPropertyNotifier.propertyTitleController,
                  hintText: AppString.enterPropertyTittle.tr(),
                ),
                CustomTextField(
                  labelText: AppString.price.tr(),
                  keyboardType: TextInputType.number,
                  controller: myPropertyNotifier.propertyPriceController,
                  hintText: AppString.enterPropertyPrice.tr(),
                ),
                CustomTextField(
                  labelText: AppString.addressStreet.tr(),
                  keyboardType: TextInputType.number,
                  controller: myPropertyNotifier.addressController,
                  hintText: AppString.enterCompleteAddress.tr(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownButton(
                        customBtn: IgnorePointer(
                          child: CustomTextField(
                            readOnly: true,
                            labelText: AppString.selectCity.tr(),
                            hintText: AppString.city.tr(),
                            controller: TextEditingController(),
                            suffixIcon: SvgPicture.asset(Assets.arrowDown),
                          ),
                        ),
                        buttonDecoration: BoxDecoration(
                          color: AppColor.transparent,
                        ),
                        hint: 'City',
                        value: "New York",
                        dropdownItems: [
                          "New York",
                          "Los Angeles",
                          "Chicago",
                          "Houston",
                          "Miami"
                        ],
                        onChanged: (String? value) {},
                      ),
                    ),
                    xWidth(context.width * 0.05),
                    Expanded(
                      child: CustomDropdownButton(
                        customBtn: IgnorePointer(
                          child: CustomTextField(
                            readOnly: true,
                            labelText: AppString.stateProvince.tr(),
                            hintText: AppString.state.tr(),
                            controller: TextEditingController(),
                            suffixIcon: SvgPicture.asset(Assets.arrowDown),
                          ),
                        ),
                        buttonDecoration: BoxDecoration(
                          color: AppColor.transparent,
                        ),
                        hint: 'State',
                        value: "California",
                        dropdownItems: [
                          "California",
                          "Texas",
                          "Florida",
                          "New York",
                          "Illinois"
                        ],
                        onChanged: (String? value) {},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: AppString.zIPCode.tr(),
                        hintText: AppString.zIPCode.tr(),
                        controller: TextEditingController(),
                      ),
                    ),
                    xWidth(context.width * 0.05),
                    Expanded(
                      child: CustomDropdownButton(
                        customBtn: IgnorePointer(
                          child: CustomTextField(
                            readOnly: true,
                            labelText: AppString.selectCountry.tr(),
                            hintText: AppString.country.tr(),
                            controller: TextEditingController(),
                            suffixIcon: SvgPicture.asset(Assets.arrowDown),
                          ),
                        ),
                        buttonDecoration: BoxDecoration(
                          color: AppColor.transparent,
                        ),
                        hint: 'Country',
                        value: "India",
                        dropdownItems: [
                          "India",
                          "Austraila",
                          "England",
                          "New York",
                          "Japan"
                        ],
                        onChanged: (String? value) {},
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: myPropertyNotifier.propertyImagesFiles.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    if (index < myPropertyNotifier.propertyImagesFiles.length) {
                      final image = myPropertyNotifier.propertyImagesFiles[index];
                      return Stack(
                        children: [
                          CustomParcelImageWidget(imgUrl: image),
                          Positioned(
                            right: context.height * 0.012,
                            top: context.height * 0.012,
                            child: GestureDetector(
                              onTap: () {
                                myPropertyNotifier.removeImage(image);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(3.0),
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: AppColor.redF75454,
                                ),
                                child: Icon(
                                  size: 14.sp,
                                  Icons.close,
                                  color: AppColor.whiteFFFFFF,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          Utils.appBottomSheet(
                            widget: CameraBottomSheetView(
                              onGetImage: (value) {
                                final File file = File(value.path);
                                myPropertyNotifier.addImage(file);
                              },
                              title: "Upload property image",
                            ),
                            context: context,
                          );
                        },
                        child: CustomAddWidget(),
                      );
                    }
                  },
                ),
                CustomTextField(
                  labelText: AppString.description.tr(),
                  keyboardType: TextInputType.name,
                  controller: myPropertyNotifier.descriptionController,
                  maxLines: 5,
                  minLines: 5,
                  hintText: AppString.enterDescription.tr(),
                ),
                CommonAppBtn(
                  title: AppString.next.tr(),
                  onTap: () => toNamed(context, Routes.addPropertyInfo),
                )
              ],
            ),
          ],
        ),
      ),
    ])));
  }
}
