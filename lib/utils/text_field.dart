import 'package:flutter/material.dart';
import 'package:tentwenty_test/config/extensions/font_extension.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';

textField(
    {required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    required Function(String) onChange,
    bool isObscure = false,
    bool isPasswordField = false,
    GestureDetector? suffixIcon,
    Icon? prefixIcon,
    TextInputType textInputType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide.none,
  );
  return Container(
    decoration: BoxDecoration(
        color: ColorPalette.grey, borderRadius: BorderRadius.circular(30)),
    child: TextFormField(
      onChanged: (val) {
        onChange(val);
      },
      keyboardType: textInputType,
      onTap: onTap,
      obscureText: isObscure,
      controller: controller,
      style: TextStyle(
        fontSize: context.font(13),
        fontWeight: FontWeight.w400,
        color: ColorPalette.darkblue,
        fontFamily: 'Poppins',
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: context.font(13),
          fontWeight: FontWeight.w400,
          color: ColorPalette.darkblue.withOpacity(0.5),
          fontFamily: 'Poppins',
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        border: border,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}
