import 'package:flutter/material.dart';

import '../core/ksizedbox.dart';

class Gap {
  static Widget width([double width = 15]) {
    return SizedBoxWidth(
      width: width,
    );
  }

  static Widget height([double height = 15]) {
    return SizedBoxHeight(
      height: height,
    );
  }
}
