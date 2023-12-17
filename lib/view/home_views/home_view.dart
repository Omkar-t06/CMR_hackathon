import 'package:flutter/material.dart';
import 'package:hospital_manage_system/utils/app_colors.dart';
import 'package:hospital_manage_system/view/widget/menu_grid.dart';
import 'package:hospital_manage_system/view/widget/scrolling_banner.dart';
import 'package:hospital_manage_system/view/widget/search_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final String? user = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Hey $user"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: SizedBox.fromSize(
          size: MediaQuery.sizeOf(context),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    child: Searchbar(),
                  ),
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.message_rounded)))
                ],
              ),
              const Text("What's News",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const ScrollingBanner(),
              const Text("How can we help you?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const MenuGrid(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: 'Home',
                backgroundColor: AppColors.secondaryColor),
            BottomNavigationBarItem(
                icon: const Icon(Icons.app_registration_rounded),
                label: 'Fill Form',
                backgroundColor: AppColors.secondaryColorLight),
            BottomNavigationBarItem(
                icon: const Icon(Icons.phone_in_talk),
                label: 'Contact',
                backgroundColor: AppColors.secondaryColor),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                label: 'Profile',
                backgroundColor: AppColors.secondaryColorLight),
          ],
        ));
  }
}
