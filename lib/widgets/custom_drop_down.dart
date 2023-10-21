// ignore_for_file: must_be_immutable

import 'package:crm/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown(
      {Key? key, this.shape,
      this.value,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.focusNode,
      this.icon,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.items,
      this.labelText,
      this.errorText,
      this.onChanged,
      this.validator}) : super(key: key);

  DropDownShape? shape;

  DropDownPadding? padding;

  DropDownVariant? variant;

  DropDownFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  FocusNode? focusNode;

  Widget? icon;

  String? hintText;
  String? errorText;
  String? labelText;

  String? value;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  List<String>? items;

  Function(String)? onChanged;

  FormFieldValidator<String>? validator;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildDropDownWidget(),
          )
        : _buildDropDownWidget();
  }

  Container _buildDropDownWidget() {
    return Container(
      width: widget.width ?? double.maxFinite,
      margin: widget.margin,
      child: DropdownButtonFormField(
        value: widget.value,
        focusNode: widget.focusNode,
        icon: widget.icon,
        style: _setFontStyle(),
        decoration: _buildDecoration(),
        items: widget.items?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: (value) {
          widget.onChanged!(value.toString());
        },
        validator: widget.validator,
      ),
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      labelText: widget.labelText,
      errorText: widget.errorText,
      prefixIcon: widget.prefix,
      prefixIconConstraints: widget.prefixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  TextStyle _setFontStyle() {
    switch (widget.fontStyle) {
      case DropDownFontStyle.ManropeSemiBold14Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          height: 1.43,
        );
      case DropDownFontStyle.ManropeMedium14Bluegray500:
        return TextStyle(
          color: ColorConstant.blueGray500,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
          height: 1.43,
        );
      default:
        return TextStyle(
          color: ColorConstant.blueGray500,
          fontSize: 14,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
          height: 1.43,
        );
    }
  }

  BorderRadius _setOutlineBorderRadius() {
    switch (widget.shape) {
      default:
        return BorderRadius.circular(10);
    }
  }

  InputBorder _setBorderStyle() {
    switch (widget.variant) {
      case DropDownVariant.FillBluegray50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case DropDownVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.blueGray400,
            width: 1,
          ),
        );
    }
  }

  Color _setFillColor() {
    switch (widget.variant) {
      case DropDownVariant.FillBluegray50:
        return ColorConstant.blueGray50;
      default:
        return ColorConstant.gray50;
    }
  }

  bool _setFilled() {
    switch (widget.variant) {
      case DropDownVariant.FillBluegray50:
        return true;
      case DropDownVariant.None:
        return false;
      default:
        return true;
    }
  }

  EdgeInsets _setPadding() {
    switch (widget.padding) {
      default:
        return EdgeInsets.only(
          left: 12,
          top: 12,
          bottom: 12,
        );
    }
  }
}

enum DropDownShape {
  RoundedBorder10,
}

enum DropDownPadding {
  PaddingT11,
}

enum DropDownVariant {
  None,
  OutlineBluegray400,
  FillBluegray50,
}

enum DropDownFontStyle {
  ManropeRegular14Bluegray500,
  ManropeSemiBold14Gray900,
  ManropeMedium14Bluegray500,
}
