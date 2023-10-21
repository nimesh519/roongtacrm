/* import 'package:crm/core/app_export.dart';
import 'package:crm/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListchartlineItemWidget extends StatelessWidget {
  ListchartlineItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
          height: 44,
          width: 44,
          margin: EdgeInsets.only(
            bottom: 18,
          ),
          variant: IconButtonVariant.FillBluegray50,
          shape: IconButtonShape.RoundedBorder10,
          padding: IconButtonPadding.PaddingAll12,
          child: CustomImageView(
            svgPath: ImageConstant.imgChartline,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtManropeBold14.copyWith(
                  letterSpacing: 
                    0.2,
                  
                ),
              ),
              Container(
                width: getHorizontalSize(
                  204,
                ),
                margin: getMargin(
                  top: 5,
                ),
                child: Text(
                  "",
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtManrope12.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: getPadding(
            left: 20,
            top: 3,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtManrope12.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.4,
                  ),
                ),
              ),
              Container(
                height: getSize(
                  8,
                ),
                width: getSize(
                  8,
                ),
                margin: getMargin(
                  top: 17,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.blue500,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
 */