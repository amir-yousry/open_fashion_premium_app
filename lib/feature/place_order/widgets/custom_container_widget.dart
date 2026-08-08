import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';

class CustomContainerWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isFree;

  const CustomContainerWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(100),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: text, color: Colors.black),
          Spacer(),
          isFree
              ? CustomText(text: "FREE", color: Colors.black)
              : SizedBox.shrink(),
          Gap(15),
          Icon(icon),
        ],
      ),
    );
  }
}
