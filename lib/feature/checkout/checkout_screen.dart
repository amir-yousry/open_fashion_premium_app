import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/consts/colors.dart';
import 'package:open_fashion_premium_app/core/widgets/button_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_appbar_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/header.dart';
import 'package:open_fashion_premium_app/feature/checkout/widgets/cart_widget.dart';
import 'package:open_fashion_premium_app/feature/checkout/widgets/promo_widget.dart';
import 'package:open_fashion_premium_app/feature/place_order/place_order_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final String name;
  final int price;
  final String description;
  final String image;

  const CheckoutScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Header(title: "Checkout"),
            CartWidget(
              image: widget.image,
              name: widget.name,
              descp: widget.description,
              price: widget.price,
              qty: selectedQty,
              onChanged: (v) {
                setState(() {
                  selectedQty = v;
                });
              },
            ),
            PromoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Est. Total", color: AppColors.primary),
                CustomText(
                  text: "\$ ${widget.price * selectedQty}",
                  color: Colors.red.shade200,
                ),
              ],
            ),
            Gap(20),
            Button(
              isSvgg: true,
              title: "Checkout",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return PlaceOrderScreen(
                        image: widget.image,
                        name: widget.name,
                        description: widget.description,
                        quantity: selectedQty,
                        price: widget.price,
                        total: widget.price * selectedQty,
                      );
                    },
                  ),
                );
              },
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }
}
