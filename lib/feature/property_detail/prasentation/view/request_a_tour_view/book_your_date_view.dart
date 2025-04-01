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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                yHeight(20.h),
                Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColor.transparent)),
                    child: PropertyBox(
                      showHorizontal: true,
                      withFullCardWidth: true,
                    )),
                yHeight(15.h),

                /// calender view
                Container(
                  decoration: Utils.boxDecoWithShadow(),
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
                                text: '${date.day}',
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
                  text: "Available slots",
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
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: AppColor.color8E8E8E.withValues(alpha: .1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.black000000,
                              // Background color of selected day
                              shape: BoxShape.circle,
                            ),
                          ),
                          xWidth(5),
                          AppText(
                            text: "10:00 AM",
                            fontFamily: AppFonts.satoshiRegular,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
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
                text: "Total Price",
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
          xWidth(20),
          Expanded(
            child: CommonAppBtn(
              title: "Book Now",
              onTap: () {
                Utils.appBottomSheet(
                    context: context,
                    widget: SuccessSheet(
                      title: AppString.bookedSuccessfully,
                      subTitle: AppString.successfullyBooked,
                      onTap: () {
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
