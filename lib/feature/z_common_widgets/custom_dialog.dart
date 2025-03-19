import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';

class CustomDialog extends StatelessWidget {
  final Widget content;

  const CustomDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            content,
            yHeight(20),
          ],
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context, {required Widget content}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(content: content);
    },
  );
}
