import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/consts/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.isBlack});
  final bool isBlack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppBar(
        actions: [
          SvgPicture.asset(
            "assets/svgs/Search.svg",
            color: isBlack ? Colors.white : AppColors.primary,
          ),
          Gap(20),
          SvgPicture.asset(
            "assets/svgs/shopping_bag.svg",
            color: isBlack ? Colors.white : AppColors.primary,
          ),
        ],
        leadingWidth: 25,
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        backgroundColor: isBlack ? AppColors.primary : Colors.white,
        leading: SvgPicture.asset(
          "assets/svgs/Menu.svg",
          color: isBlack ? Colors.white : AppColors.primary,
        ),
        title: SvgPicture.asset(
          "assets/logo/logo-bg.svg",
          color: isBlack ? Colors.white : AppColors.primary,
        ),
      ),
    );
  }
}
