import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/home_view_main.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

part '../../../../z_common_widgets/booked_success_sheet.dart';

class BookYourDateView extends StatelessWidget {
  const BookYourDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bookNowWidget(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Book Your Date"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    yHeight(20.h),
                    Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.transparent)),
                        child: PropertyBox(
                          imageHeight: 85.sp,
                          imageWidth: 120.sp,
                          showHorizontal: true,
                          withFullCardWidth: true,
                        )),
                    yHeight(20.h),

                    AppText(
                      text: AppString.chooseDate,
                      fontFamily: AppFonts.satoshiBold,
                    ),
                    yHeight(15.h),

                    /// calender view
                    Container(
                      decoration: Utils.boxDecoWithShadow(),
                      padding: EdgeInsets.all(10),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        calendarFormat: CalendarFormat.week,
                        focusedDay: DateTime.now(),
                        selectedDayPredicate: (day) {
                          return isSameDay(
                              DateTime.now(), day); // Marks the selected day
                        },
                        calendarBuilders: CalendarBuilders(
                          selectedBuilder: (context, date, _) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(9),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: AppText(
                                    text: '${date.day}'.tr(),
                                    color: Colors.white,
                                    fontFamily: AppFonts.satoshiBold,
                                  ),
                                ),
                                yHeight(5),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    // Background color of selected day
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        headerStyle: HeaderStyle(
                            titleCentered: true, formatButtonVisible: false),
                      ),
                    ),
                    yHeight(20.h),

                    /// Available slots
                    AppText(
                      text: AppString.availableSlots.tr(),
                      fontFamily: AppFonts.satoshiBold,
                    ),
                    yHeight(15.h),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2.5,
                          mainAxisSpacing: 15.h,
                          crossAxisSpacing: 15.h),
                      itemBuilder: (context, index) {
                        final isSelected = index == 1;
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: isSelected
                                ? AppColor.primary
                                : AppColor.color8E8E8E.withValues(alpha: .1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(3),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColor.whiteFFFFFF
                                      : AppColor.black000000,
                                  // Background color of selected day
                                  shape: BoxShape.circle,
                                ),
                              ),
                              xWidth(5),
                              AppText(
                                text: "10:00 AM",
                                fontFamily: AppFonts.satoshiRegular,
                                color: isSelected ? AppColor.whiteFFFFFF : null,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bookNowWidget(BuildContext context) {
    return Container(
      decoration: Utils.boxDecoWithShadow(),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: AppString.totalPrice.tr(),
                fontFamily: AppFonts.satoshiBold,
              ),
              yHeight(6),
              AppText(
                text: "\$120.00",
                fontFamily: AppFonts.satoshiBold,
                textSize: 20.sp,
                color: AppColor.primary,
              ),
            ],
          ),
          xWidth(30.w),
          Expanded(
            child: CommonAppBtn(
              title: AppString.bookNow.tr(),
              height: 45.h,
              onTap: () {
                Utils.appBottomSheet(
                    context: context,
                    widget: SuccessSheet(
                      title: AppString.bookedSuccessfully.tr(),
                      subTitle: AppString.successfullyBooked.tr(),
                      onTap: () {
                        back(context);
                        back(context);
                        back(context);
                      },
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
