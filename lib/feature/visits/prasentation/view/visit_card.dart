part of 'visit_main_view.dart';

class VisitCard extends StatelessWidget {
  const VisitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h, left: 2, right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.whiteFFFFFF,
        boxShadow: [
          BoxShadow(
            color: AppColor.black232323.withValues(alpha: 0.1),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          if(Getters.isAgent())
            ...{
              GestureDetector(
                onTap: () => toNamed(context, Routes.chatView),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomCacheNetworkImage(
                        img: "",
                        size: 40.sp,
                      ),
                      xWidth(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Savannah Nguyen",
                              fontFamily: AppFonts.satoshiBold,
                              textSize: 14.sp,
                              color: AppColor.black232323,
                            ),
                            yHeight(5),
                            AppText(
                              text: "October 25, 2019",
                              textSize: 12.sp,
                              color: AppColor.black232323,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.colorF6F6F6,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: AppColor.colorBBBBBB,
                          size: 15.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider()
            },
          PropertyBox(
            showHorizontal: true,
            imageHeight: 80.sp,
            imageWidth: 80.sp,
            showTypeOnHorizontal:true,
            showFavorite: false,
            withFullCardWidth: true,
            onTap: () => toNamed(context, Routes.propertyDetailView,args: {"isVisit":true}),
          )
        ],
      ),
    );
  }
}
