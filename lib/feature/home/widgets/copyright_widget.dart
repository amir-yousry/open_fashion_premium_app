import 'package:flutter/material.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';

class CopyrightWidget extends StatelessWidget {
  const CopyrightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade400,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, top: 10),
        child: Center(
          child: CustomText(
            max: 3,
            height: 2.5,
            text: "Copyright© OpenUI All Rights Reserved.",
          ),
        ),
      ),
    );
  }
}
