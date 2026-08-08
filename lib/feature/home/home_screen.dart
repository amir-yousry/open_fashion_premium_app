import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/consts/colors.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_appbar_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';
import 'package:open_fashion_premium_app/feature/home/widgets/about_widget.dart';
import 'package:open_fashion_premium_app/feature/home/widgets/copyright_widget.dart';
import 'package:open_fashion_premium_app/feature/home/widgets/covers_list_view_widget.dart';
import 'package:open_fashion_premium_app/feature/home/widgets/products_grid_view_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppbar(isBlack: true),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/10.svg"),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/October.svg"),
          ),
          Positioned(
            top: 85,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/Collection.svg"),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Gap(120),
                      Image.asset("assets/cover/cover1.png"),
                      Gap(20),
                      ProductsGridViewWidget(),
                      Gap(5),
                      CustomText(
                        text: "You may also like".toUpperCase(),
                        size: 26,
                      ),
                      Gap(10),
                      Image.asset("assets/svgs/line.png", width: 190),
                      Gap(40),
                      CoversListViewWidget(),
                      AboutWidget(),
                      Gap(20),
                    ],
                  ),
                ),
                CopyrightWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
