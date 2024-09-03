import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/kpadding.dart';
import '../core/kradius.dart';
import '../custom_colors/custom_colors.dart';
import '../theme/ktext_theme.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final TextInputType textinputtype;
  final String? Function(String?)? validator;
  final bool readOnly;
  final int? length;
  final int? lengthAtBottom;
  final int? maxLines;
  final Function(String val)? onTextChange;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enableUpperCase;
  final bool enableBorder;
  final Function(String)? onFeildSubmitted;
  final double marginHorizontal;
  final double? height;
  final double? width;
  final bool unfocusOnTapOutside;
  final double radius;
  final Color? backgroundColor;
  final Color hintColor;
  final String regex;
  final String title;
  final String? label;
  final bool enableShadow;
  final bool obsecureText;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? textFeildMargin;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final bool? enabled;
  final BorderRadius? borderRadius;
  final bool enableLabelFloat;
  const CustomTextFeild({
    super.key,
    required this.controller,
    this.hinttext = '',
    this.validator,
    this.readOnly = false,
    this.length,
    this.prefixIcon,
    this.textinputtype = TextInputType.text,
    required this.onTextChange,
    this.enableUpperCase = false,
    this.onTap,
    this.suffixIcon,
    this.unfocusOnTapOutside = true,
    this.onFeildSubmitted,
    this.marginHorizontal = 0,
    this.height,
    this.width,
    this.radius = 5,
    this.lengthAtBottom,
    this.maxLines,
    this.backgroundColor,
    this.hintColor = CustomColors.grey,
    this.enableBorder = false,
    this.enableShadow = false,
    this.obsecureText = false,
    this.regex = '',
    this.title = '',
    this.border,
    this.contentPadding,
    this.titlePadding,
    this.style,
    this.hintStyle,
    this.titleStyle,
    this.label,
    this.labelStyle,
    this.enabled,
    this.borderRadius,
    this.enableLabelFloat = false,
    this.textFeildMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: titlePadding ?? KPadding.only(bottom: 5),
            child: Text(
              title,
              style: titleStyle ?? KText.r15,
            ),
          ),
        Container(
          margin: textFeildMargin ??
              EdgeInsets.symmetric(horizontal: marginHorizontal),
          height: height,
          width: width,
          decoration: BoxDecoration(),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            maxLines: maxLines,
            maxLength: lengthAtBottom,
            onTap: onTap,
            enabled: enabled,
            obscureText: obsecureText,
            readOnly: readOnly,
            controller: controller,
            validator: validator,
            onChanged: onTextChange,
            inputFormatters: [
              LengthLimitingTextInputFormatter(length),
              if (regex.isNotEmpty)
                FilteringTextInputFormatter.allow(RegExp(regex)),
              enableUpperCase
                  ? UpperCaseTextFormatter()
                  : LowerCaseTextFormatter(),
            ],
            onFieldSubmitted: onFeildSubmitted,
            keyboardType: textinputtype,
            onTapOutside: (event) {
              if (unfocusOnTapOutside) {
                FocusScope.of(context).unfocus();
              }
            },
            style: style ?? KText.r16,
            decoration: InputDecoration(
              filled: true,
              alignLabelWithHint: true,
              floatingLabelBehavior: enableLabelFloat
                  ? FloatingLabelBehavior.always
                  : FloatingLabelBehavior.auto,
              fillColor: backgroundColor ?? CustomColors.white,
              contentPadding:
                  contentPadding ?? REdgeInsets.only(left: 15, top: 10),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hinttext,
              labelText: label,
              errorStyle: KText.r14Red,
              labelStyle: labelStyle ?? KText.r16,
              hintStyle: hintStyle ?? KText.r18Grey,
              border: border ??
                  OutlineInputBorder(
                      borderRadius: borderRadius ?? kBorderRadius6,
                      // borderRadius: BorderRadius.circular(radius),
                      borderSide: enableBorder
                          ? const BorderSide(color: CustomColors.grey, width: 1)
                          : BorderSide.none),
              enabledBorder: border ??
                  OutlineInputBorder(
                      borderRadius: borderRadius ?? kBorderRadius6,
                      // borderRadius: BorderRadius.circular(radius),
                      borderSide: enableBorder
                          ? const BorderSide(color: CustomColors.grey, width: 1)
                          : BorderSide.none),
              errorBorder: border ??
                  OutlineInputBorder(
                      borderRadius: borderRadius ?? kBorderRadius6,
                      borderSide: enableBorder
                          ? const BorderSide(color: CustomColors.red, width: 1)
                          : BorderSide.none),
              focusedBorder: border ??
                  OutlineInputBorder(
                      borderRadius: borderRadius ?? kBorderRadius6,
                      borderSide: enableBorder
                          ? const BorderSide(color: CustomColors.grey)
                          : BorderSide.none),
              focusedErrorBorder: border ??
                  OutlineInputBorder(
                      borderRadius: borderRadius ?? kBorderRadius6,
                      borderSide: enableBorder
                          ? BorderSide(
                              color: CustomColors.shadeGrey500, width: 1)
                          : BorderSide.none),
            ),
            cursorColor: CustomColors.grey,
          ),
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}
