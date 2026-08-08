import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/consts/colors.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/quantity_widget.dart';

class CartWidget extends StatefulWidget {
  final String image, name, description;
  final int price;
  final Function(int) onChanged;
  final int quantity;

  const CartWidget({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.onChanged,
    required this.quantity,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late int number;

  @override
  void initState() {
    number = 1;
    number = widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.image, width: 120),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(
              text: widget.name.toUpperCase(),
              spacing: 4,
              color: AppColors.primary,
            ),
            Gap(10),
            SizedBox(
              width: size.width * 0.6,
              child: CustomText(
                text: widget.description.toUpperCase(),
                spacing: 2,
                color: AppColors.primary,
                size: 11,
              ),
            ),
            Gap(30),
            Row(
              children: [
                QuantityWidget(
                  onTap: () {
                    setState(() {
                      if (number > 1) {
                        number--;
                        widget.onChanged(number);
                      }
                    });
                  },
                  svg: "assets/svgs/min.svg",
                ),
                Gap(12),
                CustomText(
                  text: number.toString(),
                  spacing: 4,
                  color: AppColors.primary,
                  weight: FontWeight.bold,
                ),
                Gap(12),
                QuantityWidget(
                  onTap: () {
                    setState(() {
                      number++;
                      widget.onChanged(number);
                    });
                  },
                  svg: "assets/svgs/plus.svg",
                ),
              ],
            ),
            Gap(28),
            CustomText(
              text: "\$ ${widget.price}",
              color: Colors.red.shade200,
              size: 22,
            ),
          ],
        ),
      ],
    );
  }
}
