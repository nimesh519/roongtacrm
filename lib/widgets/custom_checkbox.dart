// ignore_for_file: must_be_immutable

import 'package:crm/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox(
      {Key? key, this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.isRightCheck = false,
      this.iconSize,
      this.value,
      this.onChange,
      this.text,
      this.width,
      this.margin}) : super(key: key);

  CheckboxShape? shape;

  CheckboxPadding? padding;

  CheckboxVariant? variant;

  CheckboxFontStyle? fontStyle;

  Alignment? alignment;

  bool? isRightCheck;

  double? iconSize;

  bool? value;

  Function(bool)? onChange;

  String? text;

  double? width;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildCheckboxWidget(),
          )
        : _buildCheckboxWidget();
  }

  InkWell _buildCheckboxWidget() {
    return InkWell(
      onTap: () {
        value = !(value!);
        onChange!(value!);
      },
      child: Container(
        width: width,
        margin: margin ?? EdgeInsets.zero,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: isRightCheck! ? getRightSideCheckbox() : getLeftSideCheckbox(),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  Widget getRightSideCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 8,
          ),
          child: getTextWidget(),
        ),
        getCheckboxWidget(),
      ],
    );
  }

  Widget getLeftSideCheckbox() {
    return Row(
      children: [
        getCheckboxWidget(),
        Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: getTextWidget(),
        ),
      ],
    );
  }

  Widget getTextWidget() {
    return Text(
      text ?? "",
      textAlign: TextAlign.center,
      style: _setFontStyle(),
    );
  }

  Widget getCheckboxWidget() {
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: Checkbox(
        value: value ?? false,
        onChanged: (value) {
          onChange!(value!);
        },
        checkColor: ColorConstant.green500,
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }

  TextStyle _setFontStyle() {
    switch (fontStyle) {
      case CheckboxFontStyle.ManropeSemiBold12:
        return TextStyle(
            color: ColorConstant.green500,
            fontSize: 12,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            height: 1.42);
      default:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          height: 1.43,
        );
    }
  }

  EdgeInsets? _setPadding() {
    switch (padding) {
      case CheckboxPadding.PaddingT14:
        return EdgeInsets.only(
          left: 8,
          top: 14,
          right: 14,
          bottom: 14,
        );
      default:
        return null;
    }
  }

  Color? _setColor() {
    switch (variant) {
      case CheckboxVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      default:
        return null;
    }
  }

  Border? _setBorder() {
    switch (variant) {
      case CheckboxVariant.OutlineGray300:
        return Border.all(color: ColorConstant.gray300, width: 1);
      default:
        return null;
    }
  }

  BorderRadius? _setBorderRadius() {
    switch (shape) {
      case CheckboxShape.RoundedBorder8:
        return BorderRadius.circular(8);
      default:
        return null;
    }
  }
}

enum CheckboxShape { RoundedBorder8 }

enum CheckboxPadding { PaddingT14 }

enum CheckboxVariant { OutlineGray300 }

enum CheckboxFontStyle { ManropeSemiBold14Gray900, ManropeSemiBold12 }
