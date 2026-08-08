import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String description;
  final int quantity;
  final int total;

  const PlaceOrderScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: const Text('Place Order Screen')));
  }
}
