import 'package:customize_button/customize_button.dart';
import 'package:flutter/material.dart';

import '../utilities/core/kpadding.dart';
import '../utilities/core/kradius.dart';
import '../utilities/core/ksizedbox.dart';
import '../utilities/custom_colors/custom_colors.dart';
import '../utilities/theme/ktext_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.fontStyle,
    required this.onTap,
    this.backgroundColor,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.enableButton = true,
    this.width,
    required this.title,
    this.padding,
    this.enableFullSize = true,
    this.gradient1,
    this.gradient2,
    this.beginAlignment,
    this.endAlignment,
    this.elevation = 5,
    this.child,
    this.borderRadius,
  });
  final bool enableFullSize;
  final TextStyle? fontStyle;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool enableButton;
  final double? width;
  final double elevation;
  final String title;
  final EdgeInsetsGeometry? padding;
  final Color? gradient1;
  final Color? gradient2;
  final AlignmentGeometry? beginAlignment;
  final AlignmentGeometry? endAlignment;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CustomizedButton(
        elevation: 0,
        widget: Container(
          width: width,
          padding: padding ?? KPadding.vertical20,
          decoration: BoxDecoration(
              borderRadius: borderRadius ?? kBorderRadius6,
              color: backgroundColor ??
                  (enableButton ? null : CustomColors.faintGrey),
              gradient: backgroundColor == null && enableButton
                  ? LinearGradient(
                      begin: beginAlignment ?? Alignment.centerLeft,
                      end: endAlignment ?? Alignment.centerRight,
                      colors: [
                          gradient1 ?? CustomColors.gradientGreen1,
                          gradient2 ?? CustomColors.gradientGreen2
                        ])
                  : null),
          child: child ??
              Row(
                mainAxisSize:
                    enableFullSize ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: iconSize,
                      color: iconColor ??
                          (enableButton
                              ? CustomColors.white
                              : CustomColors.black),
                    ),
                    const SizedBoxWidth(
                      width: 5,
                    )
                  ],
                  Text(
                    title,
                    style: fontStyle ??
                        (enableButton ? KText.r16White : KText.r16),
                  ),
                ],
              ),
        ),
        onTap: onTap,
        backgroundColor: CustomColors.transparent);
  }
}
