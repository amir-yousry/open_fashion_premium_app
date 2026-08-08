import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';
import 'package:open_fashion_premium_app/feature/place_order/widgets/custom_container_widget.dart';

class ShippingMethodWidget extends StatelessWidget {
  const ShippingMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Shipping Method".toUpperCase(),
          color: Colors.black38,
          size: 16,
        ),
        Gap(20),
        CustomContainerWidget(
          text: "Pickup at store",
          icon: Icons.keyboard_arrow_down_sharp,
          isFree: true,
        ),
        Gap(50),
      ],
    );
  }
}
