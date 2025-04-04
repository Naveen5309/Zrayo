part of 'chat_view_main.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  colorFilter:
                      ColorFilter.mode(AppColor.whiteFFFFFF, BlendMode.srcIn),
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
                                  color: AppColor.whiteFFFFFF, width: 1.5)),
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
                        text: "Active Now",
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
    );
  }
}
