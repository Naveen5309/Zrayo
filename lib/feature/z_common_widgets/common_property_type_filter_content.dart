import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

import '../home/presentation/view/search_properties/search_property_view.dart';
import 'app_text.dart';

class CommonPropertyTypeFilterContent extends StatelessWidget {
  const CommonPropertyTypeFilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        yHeight(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: AppString.filterProperties.tr(),
              fontFamily: AppFonts.satoshiBold,
              textSize: 18.sp,
            ),
            InkWell(onTap: () => back(context), child: Icon(Icons.close))
          ],
        ),
        yHeight(25.h),
        Column(
          children: [
            propertyTypeBox({"title": "All"}, false),
            propertyTypeBox({"title": "Sale"}, true),
            propertyTypeBox({"title": "Rental"}, false),
            yHeight(20.h),
            CommonAppBtn(
              title: AppString.apply.tr(),
              onTap: () => back(context),
            ),
            yHeight(10),
          ],
        )
      ],
    );
  }
}
