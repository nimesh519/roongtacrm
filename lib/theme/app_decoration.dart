 import 'package:crm/core/app_export.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration get outlineGray300 => BoxDecoration(
        color: ColorConstant.gray5002,
        border: Border.all(
          color: ColorConstant.gray300,
          width: 1,
        ),
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get fillBlue500 => BoxDecoration(
        color: ColorConstant.blue500,
      );
  static BoxDecoration get outlineGray3002 => BoxDecoration(
        color: ColorConstant.gray5001,
        border: Border.all(
          color: ColorConstant.gray300,
          width: 1,
        ),
      );
  static BoxDecoration get fillGray9007e => BoxDecoration(
        color: ColorConstant.gray9007e,
      );
  static BoxDecoration get fillTeal900 => BoxDecoration(
        color: ColorConstant.teal900,
      );
  static BoxDecoration get outlineGray3001 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray300,
          width: 1,
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get txtOutlineGray300 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray300,
          width: 1,
        ),
      );
  static BoxDecoration get outlineBluegray1000f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blueGray1000f,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              -8,
            ),
          ),
        ],
      );
  static BoxDecoration get fillBluegray50 => BoxDecoration(
        color: ColorConstant.blueGray50,
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderTL20 = BorderRadius.only(
    topLeft: Radius.circular(
      20,
    ),
    topRight: Radius.circular(
      20,
    ),
  );

  static BorderRadius circleBorder24 = BorderRadius.circular(
    24,
  );

  static BorderRadius circleBorder35 = BorderRadius.circular(
    35,
  );

  static BorderRadius roundedBorder5 = BorderRadius.circular(5);

  static BorderRadius roundedBorder10 = BorderRadius.circular(10);

  static BorderRadius customBorderTL10 = BorderRadius.only(
    topLeft: Radius.circular(10),
    bottomLeft: Radius.circular(10),
  );

  static BorderRadius txtRoundedBorder8 = BorderRadius.circular(8);

  static BorderRadius circleBorder50 = BorderRadius.circular(
    50,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

// double get strokeAlignInside => BorderSide.strokeAlignInside;
//
// double get strokeAlignCenter => BorderSide.strokeAlignCenter;
//
// double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
