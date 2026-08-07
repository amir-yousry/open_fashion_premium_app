import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/data/products.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';
import 'package:open_fashion_premium_app/feature/checkout/checkout_screen.dart';

class ProductsGridViewWidget extends StatelessWidget {
  const ProductsGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), //BouncingScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        childAspectRatio: 0.50,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => CheckoutScreen(
                image: product.image,
                name: product.name,
                price: product.price,
                description: product.description,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.image),
              Gap(10),
              CustomText(text: product.name),
              CustomText(text: product.description, color: Colors.grey),
              Gap(9),
              CustomText(
                text: "\$ ${product.price.toString()}",
                color: Colors.red.shade200,
                size: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
