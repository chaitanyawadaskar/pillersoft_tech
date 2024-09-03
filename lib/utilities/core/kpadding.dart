import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KPadding {
  static final all5 = REdgeInsets.all(5);
  static final all6 = REdgeInsets.all(6);
  static final all8 = REdgeInsets.all(8);
  static final all10 = REdgeInsets.all(10);
  static final all12 = REdgeInsets.all(12);
  static final all15 = REdgeInsets.all(15);
  static final all16 = REdgeInsets.all(16);
  static final all18 = REdgeInsets.all(18);
  static final all20 = REdgeInsets.all(20);
  static final all25 = REdgeInsets.all(25);

  static final horizontal5 = REdgeInsets.symmetric(horizontal: 5);
  static final horizontal10 = REdgeInsets.symmetric(horizontal: 10);
  static final horizontal15 = REdgeInsets.symmetric(horizontal: 15);
  static final horizontal16 = REdgeInsets.symmetric(horizontal: 16);
  static final horizontal20 = REdgeInsets.symmetric(horizontal: 20);
  static final horizontal25 = REdgeInsets.symmetric(horizontal: 25);
  static final horizontal28 = REdgeInsets.symmetric(horizontal: 28);
  static final horizontal30 = REdgeInsets.symmetric(horizontal: 30);
  static final horizontal40 = REdgeInsets.symmetric(horizontal: 40);
  static final horizontal50 = REdgeInsets.symmetric(horizontal: 50);
  static final horizontal60 = REdgeInsets.symmetric(horizontal: 60);
  static final horizontal75 = REdgeInsets.symmetric(horizontal: 75);
  static final H15V10 = REdgeInsets.symmetric(horizontal: 15, vertical: 10);
  static final H20V10 = REdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static final H10V10 = REdgeInsets.symmetric(horizontal: 10, vertical: 10);
  static final vertical5 = REdgeInsets.symmetric(vertical: 5);
  static final vertical10 = REdgeInsets.symmetric(vertical: 10);
  static final vertical12 = REdgeInsets.symmetric(vertical: 12);
  static final vertical15 = REdgeInsets.symmetric(vertical: 15);
  static final vertical20 = REdgeInsets.symmetric(vertical: 20);
  static final vertical25 = REdgeInsets.symmetric(vertical: 25);

  static const none = EdgeInsets.zero;

  static REdgeInsets all(double value) {
    return REdgeInsets.all(value);
  }

  static REdgeInsets horizontal(double value) {
    return REdgeInsets.symmetric(horizontal: value);
  }

  static REdgeInsets vertical(double value) {
    return REdgeInsets.symmetric(vertical: value);
  }

  static REdgeInsets symmetric(double horizontal, double vertical) {
    return REdgeInsets.symmetric(
        horizontal: horizontal.w, vertical: vertical.h);
  }

  static REdgeInsets only(
      {double top = 0, double bottom = 0, double left = 0, double right = 0}) {
    return REdgeInsets.only(top: top, bottom: bottom, left: left, right: right);
  }
}
