part of 'home_view_main.dart';

class PropertyBox extends StatelessWidget {
  final bool showHorizontal;

  const PropertyBox({super.key, this.showHorizontal = false});

  @override
  Widget build(BuildContext context) {
    if (!showHorizontal) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          propertyImage(
            width: screenWidth(context) / 2.3,
            height: screenWidth(context) / 2,
            context: context,
            isNearby: true,
          ),
          yHeight(10),
          propertyInfo(),
        ],
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(right: 16, top: 2, bottom: 2),
        width: screenWidth(context) / 1.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColor.whiteFFFFFF,
          boxShadow: [
            BoxShadow(
              color: AppColor.black232323.withValues(alpha: 0.1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              propertyImage(
                width: 133.sp,
                height: 100.sp,
                context: context,
              ),
              xWidth(10),
              Expanded(child: propertyInfo()),
            ],
          ),
        ),
      );
    }
  }

  Widget propertyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: AppText(
                text: "The east apartment",
                fontFamily: AppFonts.satoshiBold,
                maxlines: 2,
                overflow: TextOverflow.ellipsis,
                // textSize: 12.sp,
              ),
            ),
          ],
        ),
        yHeight(5),
        Row(
          children: [
            Expanded(
              child: AppText(
                text: "St. Park 135, New York",
                fontFamily: AppFonts.satoshiRegular,
                textSize: 11.sp,
                maxlines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        yHeight(11.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: "\$12,589",
              fontFamily: AppFonts.satoshiBold,
              textSize: 11.sp,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.colorFEF6EC,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Icon(
                      Icons.star,
                      size: 15,
                      color: AppColor.primary,
                    ),
                  ),
                  AppText(
                    text: "3.3",
                    textSize: 10.sp,
                  ).align(),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget propertyImage({
    required double height,
    required double width,
    required BuildContext context,
    bool isNearby = false,
  }) {
    return Stack(
      children: [
        CustomCacheNetworkImage(
          img: "",
          width: width,
          height: height,
          imageRadius: 16,
        ),
        Positioned(
            top: 8,
            right: !isNearby ? null : 8,
            left: isNearby ? null : 8,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.whiteFFFFFF),
              child: SvgPicture.asset(Assets.heartUnselected),
            ))
      ],
    );
  }
}
