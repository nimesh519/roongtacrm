// ignore_for_file: must_be_immutable

import 'package:crm/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, 
    required this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  double height;
  Style? styleType;
  double? leadingWidth;
  Widget? leading;
  Widget? title;
  bool? centerTitle;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        height,
      );

  Widget? _getStyle() {
    switch (styleType) {
      case Style.bgFillGray50:
        return Container(
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.gray50,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFillGray50,
}
