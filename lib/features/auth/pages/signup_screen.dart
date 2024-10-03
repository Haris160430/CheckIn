import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_color.dart';
import '../auth_controller/logincontroller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_pass_field.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
  final LoginController controller = Get.put(LoginController());
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            // key: formKey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 140,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'sign up',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: AppColors.onSurface),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // please login to your account
                      const Text(
                        'Create an account',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: AppColors.onSurface),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AuthField(
                          hintText: "Name",
                          controller: widget.controller.username,
                          prefixIcon:Icon(Icons.person,color: AppColors.primary,)
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AuthField(
                          hintText: "Email",
                          controller: widget.controller.username,
                          prefixIcon:Icon(Icons.email,color: AppColors.primary,)
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // password text field
                      AuthPassField(
                          hintText: 'Password',
                          controller: widget.controller.passward,
                          prefixIcon: Icon(Icons.lock,color: AppColors.primary,)),
                      const SizedBox(
                        height: 16,
                      ),
                      AuthPassField(
                          hintText: 'Confirm Password',
                          controller: widget.controller.passward,
                          prefixIcon: Icon(Icons.lock,color: AppColors.primary,)
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                      // login button
                    ],
                  ),
                  AuthButton(
                      onPressed: () => widget.controller.sign_in(),
                      buttonText: 'Sign up'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
