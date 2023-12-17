import 'package:flutter/material.dart';
import 'package:hospital_manage_system/utils/app_colors.dart';

class ScrollingBanner extends StatelessWidget {
  const ScrollingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    List<Card> buildGridCards(int count) {
      List<Card> cards = List.generate(
        count,
        (int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            color: index % 2 == 0
                ? AppColors.secondaryColor
                : AppColors.secondaryColorLight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: index % 2 == 0
                      ? Image.asset('assets/jpeg/hptl1.jpeg')
                      : Image.asset('assets/jpeg/hptl2.jpeg'),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Title'),
                      SizedBox(height: 8.0),
                      Text('Secondary Text'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
      return cards;
    }

    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        children: buildGridCards(
          6,
        ),
      ),
    );
  }
}
