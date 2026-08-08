import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/consts/colors.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Divider(),
        Gap(20),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/promo.svg", width: 28),
            Gap(20),
            CustomText(text: "ADD Promo Code", color: AppColors.primary),
          ],
        ),
        Gap(20),
        Divider(),
        Gap(20),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/delivery.svg", width: 25),
            Gap(20),
            CustomText(text: "Delivery", color: AppColors.primary),
            Spacer(),
            CustomText(text: "FREE", color: AppColors.primary),
            Gap(5),
          ],
        ),
        Gap(10),
        Divider(),
      ],
    );
  }
}
