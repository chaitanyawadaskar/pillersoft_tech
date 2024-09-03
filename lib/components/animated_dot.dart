import 'package:flutter/material.dart';

import '../utilities/core/kradius.dart';
import '../utilities/custom_colors/custom_colors.dart';

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 25 : 6,
      decoration: BoxDecoration(
        color: isActive
            ? CustomColors.gradientGreen1
            : CustomColors.grey.withOpacity(0.85),
        borderRadius: kBorderRadius25,
      ),
    );
  }
}
