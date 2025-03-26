import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';

class CustomParcelImageWidget extends StatelessWidget {
  final String imgUrl;
  const CustomParcelImageWidget({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: context.width * .25,
      width: context.width * .25,
      child: CustomCacheNetworkImage(img: imgUrl, imageRadius: 12),
    );
  }
}
