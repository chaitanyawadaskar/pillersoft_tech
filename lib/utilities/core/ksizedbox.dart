import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizedBoxWidth extends StatelessWidget {
  const SizedBoxWidth({
    super.key,
    this.width = 15,
    this.child,
  });
  final double width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: child,
    );
  }
}

class SizedBoxHeight extends StatelessWidget {
  const SizedBoxHeight({
    super.key,
    this.height = 15,
    this.widget,
  });
  final double height;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: widget,
    );
  }
}
