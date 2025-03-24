part of 'property_detail_view.dart';

class PropertyMapView extends StatelessWidget {
  const PropertyMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.sp),
          decoration: Utils.boxDecoWithShadow(
              color: AppColor.green.withValues(alpha: .4)),
          height: screenHeight(context) / 5,
          width: double.infinity,
          child: AppText(text: "Map Pending").align(),
        ),
        Positioned(
            bottom: 10,
            right: 30,
            child: Column(
              children: [
                SvgPicture.asset(Assets.mapZoomIcon),
                yHeight(10),
                SvgPicture.asset(Assets.imageIcon),
              ],
            ))
      ],
    );
  }
}
