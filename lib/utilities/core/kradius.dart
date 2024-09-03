import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../custom_colors/custom_colors.dart';

// border
const kBorderBR = Border(bottom: BorderSide(), right: BorderSide());
const kBorderBGrey = Border(
  bottom: BorderSide(color: CustomColors.grey),
);
const kBorderBW4 = Border(
  bottom: BorderSide(
    color: CustomColors.black,
    width: 4,
  ),
);
final kBorderAll = Border.all(color: CustomColors.black, width: 1);
final kBorderAll2 = Border.all(color: CustomColors.black, width: 2);
final kBorderRedAll2 = Border.all(color: CustomColors.darkRed, width: 2);
final kBorderNone = Border.all(width: 0, color: CustomColors.transparent);
final kBorderAllOrange = Border.all(color: CustomColors.borderOrange, width: 1);
final kBorderAllOrangetwo =
    Border.all(color: CustomColors.borderOrange, width: 5);
final kBorderAllGrey = Border.all(color: CustomColors.grey, width: 1);
final kBorderAllGreyW5 =
    Border.all(color: CustomColors.grey2.withOpacity(0.5), width: 5);

final kBorderAllFaintGrey =
    Border.all(color: CustomColors.grey.withOpacity(0.5), width: 2);
final kBorderAllThinkWhite = Border.all(color: CustomColors.white, width: 10);
final kBorderAllRed = Border.all(color: CustomColors.darkRed, width: 1);
final kBorderAllwhite = Border.all(color: CustomColors.white, width: 1);
const kBorderRight =
    Border(right: BorderSide(color: CustomColors.black, width: 1));

// border radius
const kBorderRadiusZero = BorderRadius.zero;
final kBorderRadius2 = BorderRadius.circular(2.r);
final kBorderRadius4 = BorderRadius.circular(4.r);
final kBorderRadius5 = BorderRadius.circular(5.r);
final kBorderRadius6 = BorderRadius.circular(6.r);
final kBorderRadius8 = BorderRadius.circular(8.r);
final kBorderRadius10 = BorderRadius.circular(10.r);
final kBorderRadius12 = BorderRadius.circular(12.r);
final kBorderRadius15 = BorderRadius.circular(15.r);
final kBorderRadius20 = BorderRadius.circular(20.r);
final kBorderRadius25 = BorderRadius.circular(25.r);
final kBorderRadius30 = BorderRadius.circular(30.r);
final kBorderRadius35 = BorderRadius.circular(35.r);
final kBorderRadius40 = BorderRadius.circular(40.r);
final kBorderRadius50 = BorderRadius.circular(50.r);
//
final kBorderRadiusBottom20 = BorderRadius.only(
    bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r));
final kBorderRadiusBLR5 = BorderRadius.only(
    bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r));
final kBorderRadiusBLR25 = BorderRadius.only(
    bottomLeft: Radius.circular(25.r), bottomRight: Radius.circular(25.r));
final kBorderRadiusBLR6 = BorderRadius.only(
    bottomLeft: Radius.circular(6.r), bottomRight: Radius.circular(6.r));
final kBorderRadiusBLR12 = BorderRadius.only(
    bottomLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r));
final kBorderRadiusTLRBL12 = BorderRadius.only(
    topLeft: Radius.circular(12.r),
    topRight: Radius.circular(12.r),
    bottomLeft: Radius.circular(12.r));

final kBorderRadiusTLRBR12 = BorderRadius.only(
    topLeft: Radius.circular(12.r),
    topRight: Radius.circular(12.r),
    bottomRight: Radius.circular(12.r));
final kBorderRadiusTop20 = BorderRadius.only(
    topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r));
final kBorderRadiusTopLR10 = BorderRadius.only(
    topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r));
final kBorderRadiusTopLR12 = BorderRadius.only(
    topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r));
final kBorderRadiusTopLR25 = BorderRadius.only(
    topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r));
final kBorderRadiusTop6 = BorderRadius.only(
    topLeft: Radius.circular(6.r), topRight: Radius.circular(6.r));
final kBorderRadiusTLR4 = BorderRadius.only(
  topLeft: Radius.circular(4.r),
  topRight: Radius.circular(4.r),
);
final kBorderRadiusTLBL6 = BorderRadius.only(
  topLeft: Radius.circular(6.r),
  bottomLeft: Radius.circular(6.r),
);
final kBorderRadiusTR52 =
    BorderRadius.only(topRight: Radius.circular(52.r), topLeft: Radius.zero);
final kBorderRadiusTLR6 = BorderRadius.only(
  topLeft: Radius.circular(6.r),
  topRight: Radius.circular(6.r),
);
final kBorderRadiusTLR15 = BorderRadius.only(
  topLeft: Radius.circular(15.r),
  topRight: Radius.circular(15.r),
);
final kRoundRecBorderTop20 =
    RoundedRectangleBorder(borderRadius: kBorderRadiusTop20);

final kRoundRecBorder10r =
    RoundedRectangleBorder(borderRadius: kBorderRadius10);
final kRoundRecBorder20r =
    RoundedRectangleBorder(borderRadius: kBorderRadius20);
final kRoundRecBorder50r =
    RoundedRectangleBorder(borderRadius: kBorderRadius50);

// Input Textfield
final kOutlinedRecBorder10r = OutlineInputBorder(borderRadius: kBorderRadius10);
final kOutlinedRecBorder50r = OutlineInputBorder(
    borderRadius: kBorderRadius50, borderSide: BorderSide.none);
const kOutlinedNoBorder = OutlineInputBorder(borderSide: BorderSide.none);
