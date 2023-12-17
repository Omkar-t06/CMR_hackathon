import 'package:flutter/material.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildCard(String title, VoidCallback onTap, int index) {
      Color cardColor =
          index.isEven ? const Color(0xff50EACE) : const Color(0xff2DD7E2);

      return Card(
        elevation: 3,
        color: cardColor,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
            ],
          ),
        ),
      );
    }

    final List<String> menuTitles = [
      'Check appointment',
      'View results',
      'Medicine delivery',
      'Insurance',
    ];
    final List<VoidCallback> menuCallbacks = [
      () {
        // Callback for 'Check appointment'
        // Add your logic here
      },
      () {
        // Callback for 'View results'
        // Add your logic here
      },
      () {
        // Callback for 'Medicine delivery'
        // Add your logic here
      },
      () {
        // Callback for 'Insurance'
        // Add your logic here
      },
    ];

    return Expanded(
      child: GridView.builder(
        itemCount: 4,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return buildCard(
            menuTitles[index],
            menuCallbacks[index],
            index,
          );
        },
      ),
    );
  }
}
