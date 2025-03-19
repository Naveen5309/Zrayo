import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  final String img;
  final double size;
  final double? width;
  final double imageRadius;
  final BorderRadiusGeometry? imageBorderRadius;
  final BoxFit? fit;

  const CustomCacheNetworkImage({
    super.key,
    required this.img,
    required this.size,
    this.width,
    required this.imageRadius,
    this.imageBorderRadius,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return (img.isEmpty)
        ? Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              borderRadius: imageBorderRadius ?? BorderRadius.circular(100),
            ),
            child: SvgPicture.asset(
              Assets.placeholder,
              height: size,
              width: size,
              fit: BoxFit.cover,
            ),
          )
        : CachedNetworkImage(
            imageUrl: img,
            height: size,
            width: width ?? size,
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              height: size,
              width: width ?? size,
              decoration: BoxDecoration(
                borderRadius:
                    imageBorderRadius ?? BorderRadius.circular(imageRadius),
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit ?? BoxFit.cover,
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Container(
                height: size,
                width: width ?? size,
                decoration: BoxDecoration(
                  borderRadius:
                      imageBorderRadius ?? BorderRadius.circular(imageRadius),
                ),
                child: Center(
                  child: SizedBox(
                    height: size / 2,
                    width: size / 2,
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: AppColor.primary,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) => Container(
              height: size,
              width: width ?? size,
              decoration: BoxDecoration(
                color: AppColor.whiteFFFFFF,
                borderRadius:
                    imageBorderRadius ?? BorderRadius.circular(imageRadius),
              ),
              child: SvgPicture.asset(
                Assets.placeholder,
                height: 70.sp,
                width: 70.sp,
              ),
            ),
          );
  }
}
