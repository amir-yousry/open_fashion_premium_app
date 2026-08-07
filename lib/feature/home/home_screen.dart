import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/consts/colors.dart';
import 'package:open_fashion_premium_app/core/data/covers.dart';
import 'package:open_fashion_premium_app/core/data/products.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_appbar_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';
import 'package:open_fashion_premium_app/feature/checkout/checkout_screen.dart';
import 'package:open_fashion_premium_app/feature/home/widgets/about_widget.dart';

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
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.50,
                        ),
                        itemBuilder: (context, index) {
                          final item = products[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => CheckoutScreen(
                                  image: item.image,
                                  name: item.name,
                                  price: item.price,
                                  description: item.description,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(item.image),
                                Gap(10),
                                CustomText(text: item.name),
                                CustomText(
                                  text: item.description,
                                  color: Colors.grey,
                                ),
                                Gap(9),
                                CustomText(
                                  text: "\$ ${item.price.toString()}",
                                  color: Colors.red.shade200,
                                  size: 20,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Gap(5),
                      CustomText(
                        text: "You may also like".toUpperCase(),
                        size: 26,
                      ),
                      Gap(10),
                      Image.asset("assets/svgs/line.png", width: 190),
                      Gap(40),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: covers.length,
                          itemBuilder: (context, index) {
                            final item = covers[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    item.image,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  Gap(10),
                                  CustomText(text: item.name.toUpperCase()),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      AboutWidget(),
                      Gap(20),
                    ],
                  ),
                ),
                Container(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
