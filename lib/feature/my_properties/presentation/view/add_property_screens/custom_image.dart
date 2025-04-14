import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';

class CustomParcelImageWidget extends StatelessWidget {
  final File imgUrl;
  const CustomParcelImageWidget({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      height: context.width * .25,
      width: context.width * .25,
      clipBehavior: Clip.antiAlias,
      child: Image.file(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
