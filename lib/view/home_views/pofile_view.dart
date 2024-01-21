import 'package:flutter/material.dart';
import 'package:hospital_manage_system/utils/app_colors.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    final String? user = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              // You can add an image here or any other user profile information
              backgroundColor: AppColors.secondaryColorLight,
            ),
            const SizedBox(height: 20),
            Text(
              "$user",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$user' "@gmail.com",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            // Add more user profile information or actions here
          ],
        ),
      ),
    );
  }
}
