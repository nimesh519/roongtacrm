/* import '../notification_screen/widgets/listchartline_item_widget.dart';
import '../notification_screen/widgets/listhome_item_widget.dart';
import 'package:crm/core/app_export.dart';
import 'package:crm/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:crm/widgets/app_bar/appbar_title.dart';
import 'package:crm/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: (48),
                leadingWidth: 64,
                leading: AppbarIconbutton1(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: EdgeInsets.only(left: 24),
                    onTap: () {
                      onTapArrowleft(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Notification")),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24, top: 35, right: 24, bottom: 35),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Today",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold16
                              .copyWith(letterSpacing: (0.2))),
                      Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: (14));
                              },
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return ListhomeItemWidget();
                              })),
                      Padding(
                          padding: EdgeInsets.only(top: 22),
                          child: Text("This Week",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeBold16.copyWith(
                                  letterSpacing: (0.2)))),
                      Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: (14));
                              },
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ListchartlineItemWidget();
                              }))
                    ]))));
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
 */