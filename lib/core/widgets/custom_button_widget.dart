import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/consts/colors.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final bool isSvg;
  final String title;
  final Function()? onTap;

  const CustomButtonWidget({
    super.key,
    required this.isSvg,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.primary,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg
                  ? SvgPicture.asset("assets/svgs/shopping bag.svg", width: 20)
                  : SizedBox.shrink(),
              Gap(10),
              CustomText(text: title.toUpperCase(), size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
