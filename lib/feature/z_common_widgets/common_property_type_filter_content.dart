import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

import '../home/presentation/view/search_properties/search_property_view.dart';

class CommonPropertyTypeFilterContent extends StatelessWidget {
  const CommonPropertyTypeFilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "Filter Properties",
          action: Icon(Icons.close),
          titleSize: 18.sp,
          showBackButton: false,
        ),
        yHeight(30.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              propertyTypeBox({"title": "All"}, false),
              propertyTypeBox({"title": "Sale"}, true),
              propertyTypeBox({"title": "Rental"}, false),
              yHeight(20.h),
              CommonAppBtn(
                title: AppString.apply,
                 onTap: () => back(context),
              ),
              yHeight(10),
            ],
          ),
        )
      ],
    );
  }
}
