import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuantityWidget extends StatelessWidget {
  final Function()? onTap;
  final String svg;

  const QuantityWidget({super.key, required this.onTap, required this.svg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400, width: 1),
        ),
        child: SvgPicture.asset(svg),
      ),
    );
  }
}
