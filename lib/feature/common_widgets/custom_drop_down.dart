import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/helper.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final List<String> items;
  final Function(String?)? onChanged;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.iconPath,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.black4A4A4A),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.black4A4A4A),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.black4A4A4A),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(iconPath, height: 24, width: 24),
        ),
      ),
      hint: Text(hintText, style: TextStyle(color: AppColor.black4A4A4A)),
      icon: Icon(Icons.keyboard_arrow_down, color: AppColor.black4A4A4A),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontSize: 16)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
