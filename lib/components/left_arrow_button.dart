import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utilities/assets_paths/assets_paths.dart';
import '../utilities/core/kpadding.dart';
import '../utilities/core/kradius.dart';

class LeftArrowButton extends StatelessWidget {
  const LeftArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      icon: const Icon(
        Icons.chevron_left,
        size: 30,
      ),
    );
  }
}
