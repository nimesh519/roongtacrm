import 'package:crm/core/api/api_service.dart';
import 'package:crm/core/app_export.dart';
import 'package:crm/core/model/follow_request.dart';
import 'package:crm/core/model/get_leads_response.dart';
import 'package:crm/core/model/get_poperty_by_loc_req.dart';
import 'package:crm/core/model/todays_lead.dart';
import 'package:crm/core/model/view_leads.dart';
import 'package:crm/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:crm/widgets/app_bar/appbar_title.dart';
import 'package:crm/widgets/app_bar/custom_app_bar.dart';
import 'package:crm/widgets/custom_button.dart';
import 'package:crm/widgets/custom_icon_button.dart';
import 'package:crm/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:crm/core/model/prop_by_loc_response.dart';

class ViewTodaysFolloupLeads extends StatefulWidget {
  final String? leadId;
  final String? from;

  ViewTodaysFolloupLeads({Key? key, this.leadId,this.from}) : super(key: key);
  @override
  State<ViewTodaysFolloupLeads> createState() => _ViewLeadsState();
}

class _ViewLeadsState extends State<ViewTodaysFolloupLeads> {
  PropByLocResponse? getPropertyByLocation;
  DateTime? birthdayDate;
  bool isNotSelected = false;
  TextEditingController commentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool timeOut = false;
  // ViewleadsModel? viewLeads;
  TodaysLead? todaysLead;
  @override
  void initState() {
    getData();
    super.initState();
  }
  void getData()async {

      todaysLead = await ApiService().getViewTodaysLeads(widget.leadId.toString());
      if (todaysLead != null) {
        setState(() {});
      } else {
        setState(() {
          timeOut = true;
        });
      }


  }

  Future<void> _showBirthdayDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != birthdayDate) {
      setState(() {
        birthdayDate = pickedDate;
      });
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    Uri phoneUri;
    phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    if (!await launchUrl(phoneUri)) throw 'Could not launch $phoneUri';

  }

  // void getData() async {
  //   getPropertyByLocation = await ApiService().getByLocation(GetPropertylocReq(
  //       locationId: widget.leadId!.prospectLocation!));
  // }

  String convertToDDMMYYYY(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dateTime);
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: (90),
                leadingWidth: 64,
                leading: AppbarIconbutton1(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: EdgeInsets.only(left: 24),
                    onTap: () {
                      onTapArrowleft9(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Today's Follow Up")),
            body: SingleChildScrollView(
              child:todaysLead != null? Container(
                  width: double.maxFinite,
                  padding:
                  EdgeInsets.only(left: 24, top: 32, right: 24, bottom: 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(todaysLead!.data!.name!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeBold18
                                      .copyWith(letterSpacing: (0.2)))),
                          Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(todaysLead!.data!.empemail!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeMedium14)),

                          GestureDetector(
                              onTap: () {
                                _makePhoneCall(
                                    "+91" + todaysLead!.data!.phone!);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        CustomIconButton(
                                            height: 40,
                                            width: 40,
                                            variant: IconButtonVariant
                                                .FillBluegray50,
                                            shape:
                                            IconButtonShape.RoundedBorder10,
                                            padding:
                                            IconButtonPadding.PaddingAll12,
                                            child: CustomImageView(
                                                svgPath:
                                                ImageConstant.imgCall)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 16, top: 12, bottom: 7),
                                            child: Text(
                                                "Phone: " +
                                                    todaysLead!.data!
                                                        .phone!,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtManropeSemiBold14Gray900)),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightBlueGray500,
                                            height: (20),
                                            width: (20),
                                            margin: EdgeInsets.only(
                                                top: 10, bottom: 10))
                                      ]))),
                          Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                        height: 40,
                                        width: 40,
                                        variant: IconButtonVariant
                                            .FillBluegray50,
                                        shape:
                                        IconButtonShape.RoundedBorder10,
                                        padding:
                                        IconButtonPadding.PaddingAll12,
                                        child: CustomImageView(
                                            svgPath:
                                            ImageConstant.imgCalendar)),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, top: 12, bottom: 7),
                                        child: Text(
                                            "Enquire Date " +
                                                convertToDDMMYYYY(todaysLead!.data!.insertDate!,),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtManropeSemiBold14Gray900)),
                                    Spacer(),
                                  ])),
                          Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                        height: 40,
                                        width: 40,
                                        variant: IconButtonVariant
                                            .FillBluegray50,
                                        shape:
                                        IconButtonShape.RoundedBorder10,
                                        padding:
                                        IconButtonPadding.PaddingAll12,
                                        child: CustomImageView(
                                            svgPath:
                                            ImageConstant.imgCalendar)),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, top: 12, bottom: 7),
                                        child: Text(
                                            "Followup Date " +
                                                convertToDDMMYYYY(todaysLead!.data!.updateDate!),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtManropeSemiBold14Gray900)),
                                    Spacer(),
                                  ])),
                          //  Text(getPropertyByLocation.data.),
                          // Padding(
                          //     padding: EdgeInsets.only(top: 16),
                          //     child: Row(
                          //         mainAxisAlignment:
                          //         MainAxisAlignment.center,
                          //         children: [
                          //           CustomIconButton(
                          //               height: 40,
                          //               width: 40,
                          //               variant: IconButtonVariant
                          //                   .FillBluegray50,
                          //               shape:
                          //               IconButtonShape.RoundedBorder10,
                          //               padding:
                          //               IconButtonPadding.PaddingAll12,
                          //               child: CustomImageView(
                          //                   svgPath:
                          //                   ImageConstant.imgFile)),
                          //           Padding(
                          //               padding: EdgeInsets.only(
                          //                   left: 16, top: 10, bottom: 9),
                          //               child: Text(
                          //                   "Description: " +
                          //                       todaysLead!.data!
                          //                           .comment!,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   textAlign: TextAlign.left,
                          //                   style: AppStyle
                          //                       .txtManropeSemiBold14Gray900)),
                          //           Spacer(),
                                  // ])),
                          Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, top: 12, bottom: 7),
                                        child: Text("Add New Call",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtManropeSemiBold14Gray900b)),
                                    Spacer(),
                                    CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightBlueGray500,
                                        height: (20),
                                        width: (20),
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10))
                                  ])),
                          GestureDetector(
                            onTap: () => _showBirthdayDatePicker(context),
                            child: Container(
                              margin: EdgeInsets.only(top: 12),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: ColorConstant.blueGray50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        'New Call Date ${_formatDate(birthdayDate)}',
                                        style: TextStyle(
                                          color: ColorConstant.blueGray500,
                                          fontSize: 14,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                          height: 1.43,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isNotSelected == true
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 4),
                                child: Text(
                                  "   Please select call date",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color.fromARGB(
                                          255, 190, 31, 19)),
                                ),
                              ),
                            ],
                          )
                              : Container(),
                          CustomTextFormField(
                              maxLines: 5,
                              focusNode: FocusNode(),
                              controller: commentController,
                              hintText: "Description",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter description';
                                }

                                return null;
                              },
                              margin: EdgeInsets.only(top: 12, bottom: 5),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.multiline),
                          CustomButton(
                              onTap: () async {
                                if (birthdayDate == null) {
                                  setState(() {
                                    isNotSelected = true;
                                  });
                                } else {
                                  setState(() {
                                    isNotSelected = false;
                                  });
                                }
                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, handle the login logic here
                                  await EasyLoading.show(
                                      status: 'adding lead...',
                                      dismissOnTap: false);
                                  FollowRequest followRequest = FollowRequest(
                                      leadId: widget.leadId,
                                      dateTime: _formatDate(birthdayDate),
                                      description: commentController.text
                                    // '1', //later confirmed   Text(selectedValues.toString()),
                                  );
                                  String? result = await ApiService()
                                      .addFollow(followRequest);

                                  if (result != null && result == 'true') {
                                    await EasyLoading.dismiss();
                                    await Navigator.pushNamed(
                                        context, AppRoutes.myHomeEmptyScreen);
                                  } else {
                                    await EasyLoading.dismiss();
                                  }
                                }
                              },
                              height: (56),
                              text: "Add",
                              margin: EdgeInsets.only(top: 20),
                              shape: ButtonShape.RoundedBorder10,
                              padding: ButtonPadding.PaddingAll16,
                              fontStyle: ButtonFontStyle.ManropeBold16Gray50_1),
                        ]),
                  )):Center(child: CircularProgressIndicator()),
            )

        ));
  }

  void onTapBtnEdit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editProfileScreen);
  }


  void onTapArrowleft9(BuildContext context) {
    Navigator.pop(context);
  }


}
