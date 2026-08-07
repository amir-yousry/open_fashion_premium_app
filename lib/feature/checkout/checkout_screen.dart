import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: const Text('Splash Screen')));
  }
}
