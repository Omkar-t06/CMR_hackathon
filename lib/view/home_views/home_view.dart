// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hospital_manage_system/utils/app_colors.dart';
import 'package:hospital_manage_system/view/home_views/contact_view.dart';
import 'package:hospital_manage_system/view/home_views/fill_form_view.dart';
import 'package:hospital_manage_system/view/home_views/pofile_view.dart';
import 'package:hospital_manage_system/view/widget/menu_grid.dart';
import 'package:hospital_manage_system/view/widget/scrolling_banner.dart';
import 'package:hospital_manage_system/view/widget/search_box.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  late String? user;
  late List<Widget> _pageOptions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize user from route arguments
    user = ModalRoute.of(context)!.settings.arguments as String?;

    // Initialize _pageOptions after user is available
    _pageOptions = <Widget>[
      HomeScreen(user: user),
      const PatientRegistrationForm(),
      const ContactUs(),
      const Profileview(),
    ];
  }

  void _onItemTap(int index) {
    setState(() {
      //Initializing indexes
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppColors.secondaryColorLight,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add),
            label: 'Appointment',
            backgroundColor: AppColors.secondaryColorLight,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.contact_page),
            label: 'Contact Us',
            backgroundColor: AppColors.secondaryColorLight,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
            backgroundColor: AppColors.secondaryColorLight,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTap,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  String? user;
  HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? user;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            const MenuGrid()
          ],
        ),
      ),
    );
  }
}
