part of 'chat_view_main.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Getters.isAgent()
          ? AppColor.transparent
          : AppColor.primary.withValues(alpha: 0.1),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(34),
                  bottomRight: Radius.circular(34),
                )),
            child: Column(
              children: [
                yHeight(Platform.isIOS ? 20 : (safeAreaHeight(context) + 20.h)),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      backIcon(
                        context: context,
                        colorFilter: ColorFilter.mode(
                            AppColor.whiteFFFFFF, BlendMode.srcIn),
                      ),
                      xWidth(20),
                      Stack(
                        children: [
                          CustomCacheNetworkImage(
                            img: "",
                            size: 50.sp,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(1.5),
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: AppColor.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColor.whiteFFFFFF,
                                        width: 1.5)),
                              ),
                            ),
                          )
                        ],
                      ),
                      xWidth(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Savannah Nguyen",
                              fontFamily: AppFonts.satoshiBold,
                              textSize: 16.sp,
                              color: AppColor.whiteFFFFFF,
                            ),
                            yHeight(5),
                            AppText(
                              text: AppString.activeNow.tr(),
                              textSize: 12.sp,
                              color: AppColor.whiteFFFFFF,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (!Getters.isAgent())
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCacheNetworkImage(
                    img: "",
                    size: 50,
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppText(
                                text: "Hexagon villa",
                                textSize: 12.sp,
                                fontFamily: AppFonts.satoshiBold,
                                maxlines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        5.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.locationDark,
                              colorFilter: ColorFilter.mode(
                                  AppColor.black4A4A4A, BlendMode.srcIn),
                            ),
                            xWidth(2),
                            Expanded(
                              child: AppText(
                                text: "Street Gistieng  no 12",
                                textSize: 12.sp,
                                maxlines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CommonAppBtn(
                    title: AppString.bookVisit.tr(),
                    textSize: 14,
                    textPadding: 2,
                    margin: EdgeInsets.zero,
                    height: 41.sp,
                    width: screenWidth(context) / 3,
                    onTap: () => toNamed(context, Routes.bookYourDateView),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
