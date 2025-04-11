part of 'property_detail_view.dart';

class AllPicturesView extends StatelessWidget {
  const AllPicturesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Pictures"),
          Expanded(
              child: GridView.builder(
            shrinkWrap: true,
            itemCount: 15,
            padding: EdgeInsets.all(16.sp),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return CustomCacheNetworkImage(
                img: "https://cdn.pixabay.com/photo/2017/07/08/02/16/house-2483336_640.jpg",
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
