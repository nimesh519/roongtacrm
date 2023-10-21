// ignore_for_file: must_be_immutable

import 'package:crm/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key, this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator}) : super(key: key);

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  Container _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  TextStyle _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.ManropeSemiBold14Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          height: 1.43,
        );
      case TextFormFieldFontStyle.ManropeRegular14Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
          height: 1.43,
        );
      default:
        return TextStyle(
          color: ColorConstant.blueGray500,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
          height: 1.43,
        );
    }
  }

  BorderRadius _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.CircleBorder24:
        return BorderRadius.circular(
          24
        );
      default:
        return BorderRadius.circular(10);
    }
  }

  InputBorder _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineGray300:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
      case TextFormFieldVariant.FillBluegray5001:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBluegray40014:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBlue500:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.blue500,
            width: 1,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  Color _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.FillBluegray5001:
        return ColorConstant.blueGray5001;
      case TextFormFieldVariant.OutlineBluegray40014:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineBlue500:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.blueGray50;
    }
  }

  bool _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineGray300:
        return true;
      case TextFormFieldVariant.FillBluegray5001:
        return true;
      case TextFormFieldVariant.OutlineBluegray40014:
        return true;
      case TextFormFieldVariant.OutlineBlue500:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  EdgeInsets _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT14:
        return EdgeInsets.only(
          left: 14,
          top: 14,
          bottom: 14,
        );
      case TextFormFieldPadding.PaddingAll5:
        return EdgeInsets.all(
           7,
        );
      case TextFormFieldPadding.PaddingT13:
        return EdgeInsets.only(
          top: 14,
          bottom: 14,
        );
      default:
        return EdgeInsets.all(
          14,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder10,
  CircleBorder24,
}

enum TextFormFieldPadding {
  PaddingAll16,
  PaddingT14,
  PaddingAll5,
  PaddingT13,
}

enum TextFormFieldVariant {
  None,
  FillBluegray50,
  OutlineGray300,
  FillBluegray5001,
  OutlineBluegray40014,
  OutlineBlue500,
}

enum TextFormFieldFontStyle {
  ManropeMedium14Bluegray500,
  ManropeSemiBold14Gray900,
  ManropeRegular14Gray900,
}
