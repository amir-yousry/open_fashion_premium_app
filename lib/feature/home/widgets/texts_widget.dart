import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextsWidget extends StatelessWidget {
  const TextsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: SvgPicture.asset("assets/texts/10.svg"),
    );
  }
}
