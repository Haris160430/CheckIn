import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';


class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  final double fieldWidth;
  final Widget? prefixIcon;

  const AuthField(
      {super.key,
        required this.hintText,
        required this.controller,
        this.isObscure = false,
        required this.prefixIcon,
        this.fieldWidth = 327});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth,
      child: TextFormField(
          style: TextStyle(
            fontWeight: FontWeight.w400,  // Make text bold
            fontSize: 16,                // Optional: Adjust font size
          ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,

            labelText: hintText,
            labelStyle: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w400),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.primary, width: 2)),
            border: OutlineInputBorder(
                borderSide:
                BorderSide(width: 1, color: AppColors.primary),
                borderRadius: BorderRadius.circular(8)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return '$hintText is empty';
            }
            return null;
          },
          controller: controller,
          obscureText: isObscure),
    );
  }
}
