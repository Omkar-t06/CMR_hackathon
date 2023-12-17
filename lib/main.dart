import 'package:flutter/material.dart';
import 'package:hospital_manage_system/constants/route.dart';
import 'package:hospital_manage_system/view/authentication_screen.dart';
import 'package:hospital_manage_system/view/home_views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthenticationScreen(),
      routes: {
        homeViewRoute: (context) => const HomeView(),
      },
    );
  }
}
