import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utilities/core/kpadding.dart';
import '../utilities/core/kradius.dart';
import 'left_arrow_button.dart';

class ArrowLeftAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ArrowLeftAppbar({
    super.key,
    this.padding,
    this.enableBoxIcon = false,
    this.size = 60,
  });
  final EdgeInsetsGeometry? padding;
  final bool enableBoxIcon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: padding ??
          KPadding.only(
            top: 25,
          ),
      child: enableBoxIcon
          ? InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                  padding: KPadding.all8,
                  decoration: BoxDecoration(
                      border: kBorderAllGrey, borderRadius: kBorderRadius10),
                  child: Icon(
                    Icons.chevron_left,
                    size: 25.w,
                  )),
            )
          : const LeftArrowButton(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
