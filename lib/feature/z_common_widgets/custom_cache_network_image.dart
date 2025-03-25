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
  final double? height;
  final double imageRadius;
  final BorderRadius? imageBorderRadius;
  final BoxFit? fit;

  const CustomCacheNetworkImage({
    super.key,
    required this.img,
    this.size = 120,
    this.width,
    this.height,
    this.imageRadius = 100,
    this.imageBorderRadius,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return
        // (img.isEmpty)
        //   ? Container(
        //       height: height ?? size,
        //       width: width ?? size,
        //       decoration: BoxDecoration(
        //         borderRadius: imageBorderRadius ?? BorderRadius.circular(100),
        //       ),
        //       child: SvgPicture.asset(
        //         Assets.placeholder,
        //         height: height ?? size,
        //         width: width ?? size,
        //         fit: BoxFit.cover,
        //       ),
        //     )
        //   :
        CachedNetworkImage(
      imageUrl:
          "https://cdn.pixabay.com/photo/2016/11/18/17/46/house-1836070_640.jpg",
      height: height ?? size,
      width: width ?? size,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        height: height ?? size,
        width: width ?? size,
        decoration: BoxDecoration(
          borderRadius: imageBorderRadius ?? BorderRadius.circular(imageRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return CustomShimmerBox(
          height: height ?? size,
          width: width ?? size,
          borderRadius: imageBorderRadius ?? BorderRadius.circular(imageRadius),
        );
        // return Container(
        //   height: height ?? size,
        //   width: width ?? size,
        //   decoration: BoxDecoration(
        //     borderRadius:
        //         imageBorderRadius ?? BorderRadius.circular(imageRadius),
        //   ),
        //   child: Center(
        //     child: SizedBox(
        //       height: (height ?? size) / 2,
        //       width: (width ?? size) / 2,
        //       child: CircularProgressIndicator(
        //         value: downloadProgress.progress,
        //         color: AppColor.primary,
        //         strokeWidth: 2,
        //       ),
        //     ),
        //   ),
        // );
      },
      errorWidget: (context, url, error) => Container(
        height: size,
        width: width ?? size,
        decoration: BoxDecoration(
          color: AppColor.whiteFFFFFF,
          borderRadius: imageBorderRadius ?? BorderRadius.circular(imageRadius),
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

class CustomShimmerBox extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const CustomShimmerBox({
    super.key,
    this.width = double.infinity,
    this.height = 100.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  @override
  CustomShimmerBoxState createState() => CustomShimmerBoxState();
}

class CustomShimmerBoxState extends State<CustomShimmerBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);

    _shimmerAnimation = Tween<Alignment>(
      begin: Alignment(-1.5, 0.0),
      end: Alignment(1.5, 0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: _shimmerAnimation.value,
              end: const Alignment(1.5, 0.0),
              colors: [
                Colors.white.withValues(alpha: 0.3),
                Colors.white,
                Colors.white.withValues(alpha: 0.3)
              ],
              stops: const [0.1, 0.5, 0.9],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: widget.borderRadius,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
