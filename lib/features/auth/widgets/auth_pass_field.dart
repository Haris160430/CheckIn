import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';


class AuthPassField extends StatefulWidget {
  final String hintText;
  final double fieldWidth;
  final Widget? prefixIcon;
  final TextEditingController controller;

  AuthPassField(
      {super.key,
        required this.hintText,
        required this.controller,
        required this.prefixIcon,
        this.fieldWidth = 327});

  @override
  State<AuthPassField> createState() => _AuthPassFieldState();
}

class _AuthPassFieldState extends State<AuthPassField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fieldWidth,
      child: TextFormField(
          style: TextStyle(
            fontWeight: FontWeight.w400, // Make text bold
            fontSize: 16, // Optional: Adjust font size
          ),
          obscuringCharacter: '*',
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: AppColors.primary,
              ),
            ),
            labelText: widget.hintText,
            labelStyle: TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.w400),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 2)),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(8)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return '${widget.hintText} is empty';
            }
            return null;
          },
          controller: widget.controller,
          obscureText: isObscure),
    );
  }
}