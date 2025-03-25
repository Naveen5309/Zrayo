import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';

import 'app_text.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText, hintText;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final String? initialValue, prefixText, suffixText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int minLines;
  final bool? readOnly;

  final bool? isObscure;

  final VoidCallback? onTapOnSuffixIcon;

  final Function()? onTap;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor;
  final Color? textColor;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final bool isDisable;

  const CustomTextField({
    super.key,
    this.labelText,
    this.enableBorder,
    this.focusBorder,
    this.contentPadding,
    this.padding,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisable = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.maxLines,
    this.minLines = 1,
    this.initialValue,
    this.readOnly,
    this.onTap,
    this.border,
    this.suffixIconConstraints,
    this.prefixText,
    this.suffixText,
    this.prefixIconPadding,
    this.fillColor,
    this.textColor,
    this.hintStyle,
    this.onTapOnSuffixIcon,
    this.isObscure,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: AppColor.black4A4A4A,
      fontSize: 15.sp,
      fontFamily: AppFonts.satoshiMedium,
    );

    return Column(
      children: [
        if (labelText?.isNotEmpty ?? false)
          Row(
            children: [
              AppText(
                text: labelText ?? "",
                color: AppColor.black232323,
                fontFamily: AppFonts.satoshiMedium,
              ),
            ],
          ),
        Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 10.0),
          child: TextFormField(
            textAlign: textAlign ?? TextAlign.start,
            obscureText: isObscure ?? false,
            obscuringCharacter: "*",
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onTap: onTap,
            readOnly: readOnly ?? false,
            autofocus: false,
            initialValue: initialValue,
            keyboardType: keyboardType,
            controller: controller,
            onChanged: onChanged,
            minLines: minLines,
            maxLines: isObscure == true ? 1 : maxLines,
            onSaved: onSaved,
            decoration: InputDecoration(
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              // Adjust the vertical padding as needed
              fillColor: fillColor,
              filled: fillColor != null,
              border: border ??
                  OutlineInputBorder(
                    gapPadding: 0,
                    borderSide: BorderSide(
                        color: AppColor.grey040F2529.withValues(alpha: .16)),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
              enabledBorder: enableBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColor.grey040F2529.withValues(alpha: .16)),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
              focusedBorder: focusBorder ??
                  const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.grey040F2529),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
              // alignLabelWithHint: maxLines == null,

              hintText: hintText,
              hintStyle: hintStyle ??
                  TextStyle(
                      color: AppColor.black4A4A4A.withValues(alpha: .6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 80,
                maxWidth: 80,
              ),

              prefixIcon: prefixIcon == null
                  ? null
                  : (maxLines ?? 0) > 1
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: prefixIconPadding ??
                                const EdgeInsets.symmetric(horizontal: 12),
                            child: prefixIcon,
                          ),
                        )
                      : Padding(
                          padding: prefixIconPadding ??
                              const EdgeInsets.symmetric(horizontal: 12),
                          child: prefixIcon,
                        ),
              prefixText: prefixText,
              suffixText: suffixText,
              prefixStyle: textStyle,
              suffixStyle: textStyle,
              suffixIcon: suffixIcon == null
                  ? null
                  : GestureDetector(
                      onTap: onTapOnSuffixIcon ?? () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.w, vertical: 10),
                        child: suffixIcon,
                      ),
                    ),
              suffixIconConstraints: suffixIconConstraints ??
                  const BoxConstraints(
                    maxHeight: 60,
                    maxWidth: 60,
                  ),
            ),
            style: TextStyle(
                color: textColor ?? AppColor.black4A4A4A,
                fontFamily: AppFonts.satoshiMedium),
          ),
        ),
      ],
    );
  }
}
