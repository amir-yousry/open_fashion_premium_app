import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/data/covers.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';

class CoversListViewWidget extends StatelessWidget {
  const CoversListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: covers.length,
        itemBuilder: (context, index) {
          final cover = covers[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(cover.image, height: 350, fit: BoxFit.cover),
                Gap(10),
                CustomText(text: cover.name.toUpperCase()),
              ],
            ),
          );
        },
      ),
    );
  }
}
