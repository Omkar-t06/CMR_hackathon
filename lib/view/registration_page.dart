// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_manage_system/services/auth_services.dart';
import 'package:hospital_manage_system/utils/app_colors.dart';
import 'package:hospital_manage_system/utils/textfeild_styles.dart';
import 'package:string_validator/string_validator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, required this.controller});
  final PageController controller;
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.fromSize(
        size: MediaQuery.sizeOf(context),
        child: Stack(
          children: [
            Positioned(
              right: (MediaQuery.sizeOf(context).width / 2) - 150,
              top: 60,
              child: Transform.rotate(
                angle: -pi * 0,
                child: SvgPicture.asset(
                  'assets/svg/medition_with_box.svg',
                  width: 300,
                ),
              ),
            ),
            Positioned(
              right: 100,
              bottom: 30,
              child: Transform.rotate(
                angle: -pi * 0.04,
                child: Image.asset(
                  'assets/png/cardiogram.png',
                  width: 200,
                ),
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              bottom: 30,
              // padding: const EdgeInsets.all(30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.whiteColor.withOpacity(.8),
                ),
                child: Form(
                  key: fKey,
                  child: Column(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: AppColors.primaryHighContrast,
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your mail";
                          } else if (!isEmail(value)) {
                            return "Please enter a valid mail";
                          }
                          return null;
                        },
                        style: textFieldTextStyle(),
                        decoration: textFieldDecoration('Email'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                                obscureText: true,
                                controller: _passController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your password";
                                  } else if (value.length < 6) {
                                    return "Password must have at least 6 chars";
                                  }
                                  return null;
                                },
                                style: textFieldTextStyle(),
                                decoration: textFieldDecoration('Password')),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.whiteColor,
                          ),
                          onPressed: () async {
                            if (fKey.currentState != null &&
                                fKey.currentState!.validate()) {
                              final email = _emailController.text;
                              final password = _passController.text;
                              await AuthService.firebase()
                                  .createUser(email: email, password: password);
                              await AuthService.firebase()
                                  .sendVerificationEmail();
                              FocusManager.instance.primaryFocus?.unfocus();
                              widget.controller.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            }
                          },
                          child: const Text("Create account"),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            ' have an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 2.5,
                          ),
                          InkWell(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              widget.controller.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Text(
                              'Log In ',
                              style: TextStyle(
                                color: AppColors.primaryHighContrast,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
