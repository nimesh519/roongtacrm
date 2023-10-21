// ignore_for_file: must_be_immutable

import 'package:crm/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({Key? key, this.alignment, this.margin, this.value, this.onChanged}) : super(key: key);

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  bool? value;

  Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildSwitchWidget(),
          )
        : _buildSwitchWidget();
  }

  Padding _buildSwitchWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: FlutterSwitch(
        value: value ?? false,
        height: (24),
        width: (44),
        toggleSize: 24,
        borderRadius: 12,
        activeColor: ColorConstant.blue500,
        activeToggleColor: ColorConstant.gray50,
        inactiveColor: ColorConstant.blueGray50,
        inactiveToggleColor: ColorConstant.gray50,
        onToggle: (value) {
          onChanged!(value);
        },
      ),
    );
  }
}
