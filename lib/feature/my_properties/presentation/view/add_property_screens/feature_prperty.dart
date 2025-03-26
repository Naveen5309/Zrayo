import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

class FeaturePrpertyView extends StatelessWidget {
  const FeaturePrpertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackF7F8FB,
      body: Column(
        children: [
          CustomAppBar(title: AppString.addProperty),
          yHeight(10.sp),
          Container(
            height: 5,
            color: AppColor.orangeFff9f0,
            width: screenWidth(context),
            child: Row(
              children: [
                Container(
                  height: 5,
                  width: (screenWidth(context) / 5) * 5,
                  color: AppColor.primary,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height / 8)),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        width: context.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColor.whiteFFFFFF,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 18,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 40),
                            Text(
                              AppString.featureyourProperty,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: AppFonts.satoshiBold,
                              ),
                            ),
                            yHeight(8),
                            AppText(
                              text: AppString.increaseVisibilityBuyer,
                              textAlign: TextAlign.center,
                              color:
                                  AppColor.black000000.withValues(alpha: 0.6),
                              fontFamily: AppFonts.satoshiRegular,
                              textSize: 14.sp,
                            ),
                            yHeight(22),
                            AppText(
                              text: "@ \$120",
                              textSize: 24.sp,
                              fontFamily: AppFonts.satoshiBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -38,
                    child: SizedBox(
                      width: 88,
                      height: 88,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.whiteFFFFFF,
                            border: Border.all(
                                color: AppColor.blackF7F8FB, width: 8),
                            shape: BoxShape.circle),
                        child: Lottie.asset(Assets.homeJson),
                      ),
                    ),
                  ),
                ],
              ),
              yHeight(context.height * 0.15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CommonAppBtn(
                      title: AppString.buyNow,
                    ),
                    yHeight(18),
                    CommonAppBtn(
                      title: AppString.skip,
                      textColor: AppColor.primary,
                      backGroundColor:
                          AppColor.orangeEA8913.withValues(alpha: .24),
                    ),
                    yHeight(11),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// // class BottomCurveClipper extends CustomClipper<Path> {
// //   @override
// //   Path getClip(Size size) {
// //     Path path = Path();

// //     double width = size.width;
// //     double height = size.height;
// //     double arcHeight = 40; // 👈 Arc height set kiya (Adjust if needed)

// //     path.lineTo(0, height - arcHeight);

// //     // 👇 Smooth curved arc effect
// //     path.quadraticBezierTo(width / 2, height, width, height - arcHeight);

// //     path.lineTo(width, 0);
// //     path.close();

// //     return path;
// //   }

// //   @override
// //   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// // }
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:zrayo_flutter/config/assets.dart';
// import 'package:zrayo_flutter/config/helper.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.grey[200],
//         body: Center(
//           child: FeatureCard(),
//         ),
//       ),
//     );
//   }
// }

// class FeatureCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       height: 450,
//       width: 300,
//       child: Container(
//         width: 250,
//         height: 400,
//         color: Colors.white,
//         child: Stack(
//           alignment: Alignment.center,
//           clipBehavior: Clip.none,
//           children: [
//             Positioned(
//               top: -20,
//               child: Container(
//                 width: 150,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 5,
//                     )
//                   ],
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                   border: Border.all(color: AppColor.transparent, width: 6),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           width: 300,
//           padding: EdgeInsets.only(top: 80),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 spreadRadius: 2,
//                 offset: Offset(0, 5),
//               ),
//             ],
//           ),
//           child: ClipPath(
//             clipper: BottomCurveClipper(),
//             child: Container(
//               color: Colors.white,
//               padding: EdgeInsets.only(top: 20, bottom: 50),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(height: 20),
//                   Text(
//                     "Feature your property",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                     child: Text(
//                       "Increase visibility and attract more buyers.\nPay now to highlight your listing!",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "@ \$120",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: -40,
//           left: 0,
//           right: 0,
//           child: CircleAvatar(
//             radius: 39,
//             backgroundColor: Colors.white,
//             child: CircleAvatar(
//               radius: 62,
//               backgroundColor: Colors.blueAccent.withOpacity(0.2),
//               child: Lottie.asset(Assets.homeJson),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class BottomCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     double width = size.width;
//     double height = size.height;
//     double arcHeight = 40;

//     path.lineTo(0, height - arcHeight);

//     path.quadraticBezierTo(width / 2, height, width, height - arcHeight);

//     path.lineTo(width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
