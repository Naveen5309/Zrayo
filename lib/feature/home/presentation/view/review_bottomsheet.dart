import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/home/presentation/providers/home_provider.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/home_view_main.dart';
import 'package:zrayo_flutter/feature/property_detail/prasentation/view/request_a_tour_view/book_your_date_view.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class ReviewBottomsheet extends ConsumerWidget {
  final String? title;
  final String? subtitle;
  final bool isProperty;
  final String? name;
  const ReviewBottomsheet(
      {this.title,
      this.subtitle,
      this.name,
      this.isProperty = false,
      super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final rating = ref.watch(ratingProvider);

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: title ?? AppString.rateYourVisite.tr(),
                textSize: 20.sp,
                fontFamily: AppFonts.satoshiBold,
              ),
              yHeight(10),
              AppText(
                  text: subtitle ?? AppString.shareFeedback.tr(),
                  fontFamily: AppFonts.satoshiRegular,
                  color: AppColor.black000000.withValues(alpha: .6)),
              yHeight(20),
              isProperty
                  ? Column(
                      children: [
                        CustomCacheNetworkImage(
                          img: '',
                          size: 88,
                        ),
                        yHeight(12),
                        AppText(text: name ?? ''.tr())
                      ],
                    )
                  : Card(
                      child: PropertyBox(
                        showHorizontal: true,
                        imageHeight: 70.h,
                        imageWidth: 70.w,
                        showFavorite: false,
                        withFullCardWidth: true,
                      ),
                    ),
              yHeight(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return InkWell(
                    child: SvgPicture.asset(
                      index < rating ? Assets.stars : Assets.starOff,
                    ),
                    onTap: () => ref
                        .read(ratingProvider.notifier)
                        .update((_) => index + 1),
                  );
                }),
              ),
              yHeight(20),
              Row(
                children: [
                  AppText(
                    text: AppString.description.tr(),
                    color: AppColor.black232323,
                  ),
                ],
              ),
              yHeight(2),
              CustomTextField(
                hintText: AppString.enterDescription,
                maxLines: 4,
                minLines: 4,
              ),
              yHeight(10),
              CommonAppBtn(
                title: AppString.submit.tr(),
                onTap: () {
                  back(context);
                  Utils.appBottomSheet(
                      context: context,
                      widget: SuccessSheet(
                        title: AppString.ratingSubmittedSuccessfully,
                      ));
                },
              )
            ],
          ),
        ));
  }
}
