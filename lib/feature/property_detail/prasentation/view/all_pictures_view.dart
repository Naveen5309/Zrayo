part of 'property_detail_view.dart';
class AllPicturesView extends StatelessWidget {
  const AllPicturesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          yHeight(10.h),
          CustomAppBar(title: "Pictures"),
          Expanded(child:  GridView.builder(
            shrinkWrap: true,
            itemCount: 15,
            padding: EdgeInsets.all(16.sp),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
            itemBuilder: (context, index) {
              return  CustomCacheNetworkImage(
                img: "",
                size: 74.sp,
                imageRadius: 4.sp,
              );
            },
          ))
        ],
      ),
    );
  }
}
