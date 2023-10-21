// ignore_for_file: must_be_immutable

import 'package:crm/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key, this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget}) : super(key: key);

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  Padding _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  Widget _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  ButtonStyle _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? 40,
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  EdgeInsets _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll16:
        return EdgeInsets.all(
          17,
        );
      case ButtonPadding.PaddingAll13:
        return EdgeInsets.all(
          13,
        );
      case ButtonPadding.PaddingT17:
        return EdgeInsets.only(
          top: 17,
          right: 17,
          bottom: 17,
        );
      case ButtonPadding.PaddingT7:
        return EdgeInsets.only(
          top: 8,
          right: 8,
          bottom: 8,
        );
      case ButtonPadding.PaddingAll12:
        return EdgeInsets.all(
          10,
        );
      case ButtonPadding.PaddingT10:
        return EdgeInsets.only(
          top: 12,
          right: 12,
          bottom: 12,
        );
      case ButtonPadding.PaddingT9:
        return EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 10,
        );
      default:
        return EdgeInsets.all(
           6,
        );
    }
  }

  Color? _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineBluegray500:
        return ColorConstant.blueGray50;
      case ButtonVariant.FillBlue50:
        return ColorConstant.blue50;
      case ButtonVariant.OutlineBlue500_1:
        return ColorConstant.gray50;
      case ButtonVariant.FillGray900:
        return ColorConstant.gray900;
      case ButtonVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBluegray500_1:
        return ColorConstant.gray900;
      case ButtonVariant.OutlineGray300_1:
        return ColorConstant.gray50;
      case ButtonVariant.OutlineBluegray40014:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBlue500_2:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillBluegray50:
        return ColorConstant.blueGray50;
      case ButtonVariant.OutlineBlue500_3:
        return ColorConstant.blueGray50;
      case ButtonVariant.OutlineBlue500:
        return null;
      default:
        return ColorConstant.blue500;
    }
  }

  BorderSide? _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineBluegray500:
        return BorderSide(color: ColorConstant.blueGray500, width: 1);
      case ButtonVariant.OutlineBlue500:
        return BorderSide(color: ColorConstant.blue500, width: 1);
      case ButtonVariant.OutlineBlue500_1:
        return BorderSide(color: ColorConstant.blue500, width: 1);
      case ButtonVariant.OutlineGray300:
        return BorderSide(color: ColorConstant.gray300, width: 1);
      case ButtonVariant.OutlineBluegray500_1:
        return BorderSide(color: ColorConstant.blueGray500, width: 1);
      case ButtonVariant.OutlineGray300_1:
        return BorderSide(color: ColorConstant.gray300, width: 1);
      case ButtonVariant.OutlineBlue500_2:
        return BorderSide(color: ColorConstant.blue500, width: 1);
      case ButtonVariant.OutlineBlue500_3:
        return BorderSide(color: ColorConstant.blue500, width: 1);
      case ButtonVariant.FillBlue500:
      case ButtonVariant.FillBlue50:
      case ButtonVariant.FillGray900:
      case ButtonVariant.OutlineBluegray40014:
      case ButtonVariant.FillBluegray50:
        return null;
      default:
        return null;
    }
  }

  Color? _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBluegray40014:
        return ColorConstant.blueGray40014;
      case ButtonVariant.FillBlue500:
      case ButtonVariant.OutlineBluegray500:
      case ButtonVariant.OutlineBlue500:
      case ButtonVariant.FillBlue50:
      case ButtonVariant.OutlineBlue500_1:
      case ButtonVariant.FillGray900:
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.OutlineBluegray500_1:
      case ButtonVariant.OutlineGray300_1:
      case ButtonVariant.OutlineBlue500_2:
      case ButtonVariant.FillBluegray50:
      case ButtonVariant.OutlineBlue500_3:
        return null;
      default:
        return null;
    }
  }

  BorderRadius _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder10:
        return BorderRadius.circular(10);
      case ButtonShape.RoundedBorder5:
        return BorderRadius.circular(5);
      case ButtonShape.CustomBorderTL10:
        return BorderRadius.only(
          topLeft: Radius.circular(
            10,
          ),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(
            10,
          ),
          bottomRight: Radius.circular(
            10,
          ),
        );
      case ButtonShape.CircleBorder13:
        return BorderRadius.circular(13);
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(16);
    }
  }

  TextStyle _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.ManropeBold16WhiteA700_1:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          height: 1.38,
        );
      case ButtonFontStyle.ManropeBold16Bluegray50:
        return TextStyle(
          color: ColorConstant.blueGray50,
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          height: 1.38,
        );
      case ButtonFontStyle.ManropeBold16Gray50_1:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          height: 1.38,
        );
      case ButtonFontStyle.ManropeSemiBold16Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          height: 1.38,
        );
      case ButtonFontStyle.ManropeSemiBold14Blue500:
        return TextStyle(
          color: ColorConstant.blue500,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          height: 1.43,
        );
      case ButtonFontStyle.ManropeBold14WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          height: 1.43,
        );
      case ButtonFontStyle.ManropeMedium14Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
          height: 1.43,
        );
      case ButtonFontStyle.ManropeBold14Blue500_1:
        return TextStyle(
          color: ColorConstant.blue500,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          height: 1.43,
        );
      case ButtonFontStyle.ManropeSemiBold14WhiteA700_1:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          height: 1.43,
        );
      case ButtonFontStyle.ManropeMedium12Gray900:
        return TextStyle(
            color: ColorConstant.gray900,
            fontSize: 12,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
            height: 1.42);
      case ButtonFontStyle.SFProDisplayMedium10Bluegray50:
        return TextStyle(
            color: ColorConstant.blueGray50,
            fontSize: 10,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 1.20);
      case ButtonFontStyle.ManropeBold12Gray300_1:
        return TextStyle(
            color: ColorConstant.gray300,
            fontSize: 12,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
            height: 1.42);
      case ButtonFontStyle.ManropeBold12WhiteA700_1:
        return TextStyle(
            color: ColorConstant.whiteA700,
            fontSize: 12,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
            height: 1.42);
      case ButtonFontStyle.ManropeBold14Gray900_1:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          height: 1.43,
        );
      case ButtonFontStyle.ManropeBold16Blue500_1:
        return TextStyle(
          color: ColorConstant.blue500,
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          height: 1.38,
        );
      case ButtonFontStyle.ManropeSemiBold14Bluegray500_1:
        return TextStyle(
            color: ColorConstant.blueGray500,
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            height: 1.43);
      case ButtonFontStyle.ManropeExtraBold10Gray900:
        return TextStyle(
            color: ColorConstant.gray900,
            fontSize: 10,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w800,
            height: 1.4);
      case ButtonFontStyle.ManropeSemiBold14Gray900_1:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          height: 1.43,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 12,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
          height: 1.42,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder10,
  RoundedBorder5,
  CustomBorderTL10,
  RoundedBorder16,
  CircleBorder13,
}

enum ButtonPadding {
  PaddingAll16,
  PaddingAll13,
  PaddingT17,
  PaddingT7,
  PaddingAll6,
  PaddingAll12,
  PaddingT10,
  PaddingT9,
}

enum ButtonVariant {
  FillBlue500,
  OutlineBluegray500,
  OutlineBlue500,
  FillBlue50,
  OutlineBlue500_1,
  FillGray900,
  OutlineGray300,
  OutlineBluegray500_1,
  OutlineGray300_1,
  OutlineBluegray40014,
  OutlineBlue500_2,
  FillBluegray50,
  OutlineBlue500_3,
}

enum ButtonFontStyle {
  ManropeBold16WhiteA700_1,
  ManropeBold16Bluegray50,
  ManropeBold16Gray50_1,
  ManropeSemiBold16Gray900,
  ManropeSemiBold14Blue500,
  ManropeBold14WhiteA700,
  ManropeMedium14Gray900,
  ManropeBold14Blue500_1,
  ManropeSemiBold14WhiteA700_1,
  ManropeMedium12Gray900,
  SFProDisplayMedium10Bluegray50,
  ManropeBold12Gray900,
  ManropeBold12Gray300_1,
  ManropeBold12WhiteA700_1,
  ManropeBold14Gray900_1,
  ManropeBold16Blue500_1,
  ManropeSemiBold14Bluegray500_1,
  ManropeExtraBold10Gray900,
  ManropeSemiBold14Gray900_1,
}
