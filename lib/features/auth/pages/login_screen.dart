import 'package:checkin/features/auth/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_color.dart';
import '../auth_controller/logincontroller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_pass_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  final LoginController controller = Get.put(LoginController());
}

class _LoginScreenState extends State<LoginScreen> {
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
                    height: 150,
                  ),
                  // ClipRRect(
                  //   child: Image.asset(
                  //     'assets/images/splash.png',
                  //     width: 200,
                  //     height: 140,
                  //   ),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'LOGIN',
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
                        'Please login to your account',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: AppColors.onSurface),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AuthField(
                        hintText: 'Email',
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
                      buttonText: 'Login'),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignupScreen());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'If you dont have account? ',
                        style: TextStyle(color: Colors.black45),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Signup',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF1A5B8C))),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
