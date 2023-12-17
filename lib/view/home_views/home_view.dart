import 'package:flutter/material.dart';
import 'package:hospital_manage_system/utils/app_colors.dart';
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
            )
          ],
        ),
      ),
    );
  }
}
