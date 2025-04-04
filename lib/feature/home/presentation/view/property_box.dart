part of 'home_view_main.dart';

class PropertyBox extends StatelessWidget {
  final bool showHorizontal;
  final bool showFavorite;
  final bool showTypeOnHorizontal;
  final bool isFavorite;
  final double? imageHeight;
  final double? imageWidth;
  final bool withFullCardWidth;
  final Color? textColor;
  final VoidCallback? onTap;

  const PropertyBox({
    super.key,
    this.showHorizontal = false,
    this.showTypeOnHorizontal = false,
    this.showFavorite = true,
    this.isFavorite = false,
    this.imageHeight,
    this.imageWidth,
    this.textColor,
    this.onTap,
    this.withFullCardWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!=null?onTap!():toNamed(context, Routes.propertyDetailView),
      child: !showHorizontal
          ? Column(
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
            )
          : Container(
              margin: EdgeInsets.only(
                  right: withFullCardWidth ? 0 : 16, top: 2, bottom: 2),
              width: withFullCardWidth
                  ? double.infinity
                  : screenWidth(context) / 1.4,
              decoration: withFullCardWidth
                  ? null
                  : BoxDecoration(
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
                      width: imageWidth ?? 133.sp,
                      height: imageHeight ?? 100.sp,
                      context: context,
                    ),
                    xWidth(10),
                    Expanded(child: propertyInfo()),
                  ],
                ),
              ),
            ),
    );
  }

  Widget propertyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        yHeight(5),
        Row(
          children: [
            Expanded(
              child: AppText(
                text: "The east apartment",
                fontFamily: AppFonts.satoshiBold,
                maxlines: 2,
                color: textColor,
                overflow: TextOverflow.ellipsis,
                // textSize: 12.sp,
              ),
            ),
            if(showTypeOnHorizontal)
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                  color: AppColor.colorF6F6F6,
                  borderRadius: BorderRadius.circular(24)),
              child: AppText(
                text: "For Sale",
                textSize: 12.sp,
                color: AppColor.color5A5A5A,
              ),
            )
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
                maxlines: 1,
                color: textColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        yHeight(withFullCardWidth ? 16.h : 11.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: "\$12,589",
              fontFamily: AppFonts.satoshiBold,
              textSize: 11.sp,
              color: textColor,
            ),
            CustomRatingBox(rating: "3.3")
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
          imageRadius: 12,
        ),
        if (!showHorizontal)
          Positioned(
              top: 8,
              left: 5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                    color: AppColor.whiteFFFFFF,
                    borderRadius: BorderRadius.circular(24)),
                child: AppText(
                  text: "For Sale",
                  textSize: 12.sp,
                  color: AppColor.color5A5A5A,
                ),
              )),
        if (showFavorite)
          Positioned(
              top: 8,
              right: !isNearby ? null : 8,
              left: isNearby ? null : 8,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.whiteFFFFFF),
                child: SvgPicture.asset(
                  isFavorite ? Assets.heartSelected : Assets.heartUnselected,
                ),
              ))
      ],
    );
  }
}
