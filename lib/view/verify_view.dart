import 'package:flutter/material.dart';
import 'package:hospital_manage_system/services/auth_services.dart';

import 'package:hospital_manage_system/utils/app_colors.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String? verifyCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.fromSize(
        size: MediaQuery.sizeOf(context),
        child: Stack(
          children: [
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
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We've sent a verification email please check it and verify yourself",
                      style: TextStyle(
                        color: AppColors.primaryHighContrast,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: TextButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          widget.controller.animateToPage(0,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.ease);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.whiteColor,
                        ),
                        child: Text(
                          'confirm',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'If you haven\'t received a verification email click below',
                      style: TextStyle(
                        color: AppColors.primaryHighContrast,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: TextButton(
                        onPressed: () async {
                          await AuthService.firebase().sendVerificationEmail();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.whiteColor,
                        ),
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
