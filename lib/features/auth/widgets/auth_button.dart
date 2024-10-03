import 'package:flutter/material.dart';
import '../../../core/theme/app_color.dart';


class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const AuthButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.primary),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            fixedSize: const Size(327, 40),
            elevation: 0,
            backgroundColor: AppColors.transparent,
            shadowColor: Colors.transparent, // Remove shadow (optional)
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              color: AppColors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
