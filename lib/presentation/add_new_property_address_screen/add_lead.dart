// ignore_for_file: must_be_immutable, sdk_version_since

import 'package:crm/core/api/api_service.dart';
import 'package:crm/core/api/data_store.dart';
import 'package:crm/core/app_export.dart';
import 'package:crm/core/model/add_lead_request.dart';
import 'package:crm/core/model/get_property_reponse.dart';
import 'package:crm/presentation/app_drawer.dart';
import 'package:crm/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:crm/widgets/app_bar/appbar_title.dart';
import 'package:crm/widgets/app_bar/custom_app_bar.dart';
import 'package:crm/widgets/custom_button.dart';
import 'package:crm/widgets/custom_drop_down.dart';
import 'package:crm/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class AddLead extends StatefulWidget {
  const AddLead({Key? key}) : super(key: key);

  @override
  State<AddLead> createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController phone2Controller = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController callTypeController = TextEditingController();

  TextEditingController leadDesc = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
  List<String> dropdownItemListSource = ["Facebook", "Instagram", "Whatsapp"];

  TextEditingController zipcodeController = TextEditingController();

  TextEditingController propertyTypeController = TextEditingController();

  TextEditingController commentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> propertyNames = [];
  List<String> propertytypeList = [];
  String? locationName;
  String? propertystatus;
  String? categoryType;
  String? propertyType;
  String? projectId;
  String? locationId;
  String? categoryId;
  String? propertyId;
  String? propertyStatusId;
  String? user;
  bool showError = false;
  DateTime? birthdayDate;
  DateTime? anniversaryDate;
  DateTime? selectedDateTime;

  //Hook<String> locationName = Hook<String>(initialValue: null);
  Getpropertyresponse? getpropertyresponse;

  String? selectedProperty;
  void openAppDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void initState() {
    super.initState();
    getProperty();
  }

  List<String> selectedValues = [];

  void removeValue(String value) {
    setState(() {
      if (selectedValues.length > 1) {
        selectedValues.remove(value);
      }
    });
  }

  String getNumbersOnly(String inputString) {
    RegExp regex = RegExp(r'\d+');
    Iterable<Match> matches = regex.allMatches(inputString);

    StringBuffer result = StringBuffer();
    for (Match match in matches) {
      result.write(match.group(0));
    }

    return result.toString();
  }

  Future<void> getProperty() async {
    user = await DataStore.getUserID();
    getpropertyresponse = await ApiService().getPropertyApi();
    Set<String> uniquePropertyNames = {};
    getpropertyresponse!.data.naPlots.forEach((property) {
      uniquePropertyNames.add(property.name);
    });

    getpropertyresponse!.data.residential.forEach((property) {
      uniquePropertyNames.add(property.name);
    });

    getpropertyresponse!.data.commercial.forEach((property) {
      uniquePropertyNames.add(property.name);
      propertyNames = uniquePropertyNames.toList();
    });
    setState(() {});
    // Extract property names from both NaPlots and Residential properties
  }

  String? findLocationName(String searchString) {
    List<NaPlot> naPlots = getpropertyresponse!.data.naPlots;
    List<Residential> residentials = getpropertyresponse!.data.residential;
    List<Commercial> commercial = getpropertyresponse!.data.commercial;

    for (NaPlot property in naPlots) {
      if (property.name == searchString) {
        projectId = property.id;
        locationId = property.locationId;
        categoryId = property.categoryId;
        propertyStatusId = property.status;
        return property.locationName;
      }
    }

    for (Residential property in residentials) {
      if (property.name == searchString) {
        projectId = property.id;
        locationId = property.locationId;
        categoryId = property.categoryId;
        propertyStatusId = property.status;
        return property.locationName;
      }
    }

    for (Commercial property in commercial) {
      if (property.name == searchString) {
        projectId = property.id;
        locationId = property.locationId;
        categoryId = property.categoryId;
        propertyStatusId = property.status;
        return property.locationName;
      }
    }

    return null; // Return null if the property name is not found
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

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            // pickedTime.hour,
            // pickedTime.minute,
          );
        });
      }
    }
  }

  Future<void> _showAnniversaryDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != anniversaryDate) {
      setState(() {
        anniversaryDate = pickedDate;
      });
    }
  }

  bool isValidIndianPhoneNumber(String phoneNumber) {
    // Regular expression pattern for an Indian phone number
    // It allows numbers starting with +91 or 0, followed by 10 digits.
    RegExp regex = RegExp(r"^(?:\+91|0)?[6789]\d{9}$");

    return regex.hasMatch(phoneNumber);
  }

  String? findCategory(String searchString) {
    List<NaPlot> naPlots = getpropertyresponse!.data.naPlots;
    List<Residential> residentials = getpropertyresponse!.data.residential;
    List<Commercial> commercial = getpropertyresponse!.data.commercial;

    for (NaPlot property in naPlots) {
      if (property.name == searchString) {
        return "NaPlot";
      }
    }

    for (Residential property in residentials) {
      if (property.name == searchString) {
        return "Residential";
      }
    }

    for (Commercial property in commercial) {
      if (property.name == searchString) {
        return "Commercial";
      }
    }

    return null; // Return null if the property name is not found
  }

  String? findPropertyStatus(String searchString) {
    List<NaPlot> naPlots = getpropertyresponse!.data.naPlots;
    List<Residential> residentials = getpropertyresponse!.data.residential;
    List<Commercial> commercial = getpropertyresponse!.data.commercial;

    for (NaPlot property in naPlots) {
      if (property.name == searchString) {
        return property.propertyStatus.name;
      }
    }

    for (Residential property in residentials) {
      if (property.name == searchString) {
        return property.propertyStatus.name;
      }
    }

    for (Commercial property in commercial) {
      if (property.name == searchString) {
        return property.propertyStatus.name;
      }
    }

    return null; // Return null if the property name is not found
  }

  List<String>? findType(String searchString) {
    List<NaPlot> naPlots = getpropertyresponse!.data.naPlots;
    List<Residential> residentials = getpropertyresponse!.data.residential;
    List<Commercial> commercial = getpropertyresponse!.data.commercial;

    List<String> results = [];

    // Check in naPlots list
    for (NaPlot property in naPlots) {
      if (property.name == searchString) {
        results.addAll(property.propertyType
            .map((propertyType) => propertyType.name ));//+ " " + property.id));
      }
    }

    // Check in residentials list
    for (Residential property in residentials) {
      if (property.name == searchString) {
        results.addAll(property.propertyType
            .map((propertyType) => propertyType.name));//+ " " + property.id));
      }
    }

    // Check in commercial list
    for (Commercial property in commercial) {
      if (property.name == searchString) {
        results.addAll(property.propertyType
            .map((propertyType) => propertyType.name ));//+ " " + property.id));
      }
    }

    return results.isEmpty
        ? null
        : results; // Return null if the property name is not found
  }

  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy hh:mm a');
    return formatter.format(dateTime);
  }

  /* String? findType(String searchString) {
    List<NaPlot> naPlots = getpropertyresponse!.data.naPlots;
    List<Residential> residentials = getpropertyresponse!.data.residential;
    List<Commercial> commercial = getpropertyresponse!.data.commercial;

    for (NaPlot property in naPlots) {
       if (property.name == searchString) {
        return property.propertyType
            .map((propertyType) => propertyType.name + " " + property.id)
            .toList()
            .join(", ");
      }
    }

    for (Residential property in residentials) {
       if (property.name == searchString) {
        return property.propertyType
            .map((propertyType) => propertyType.name + " " + property.id)
            .toList()
            .join(", ");
      }
    }

    for (Commercial property in commercial) {
       if (property.name == searchString) {
        return property.propertyType
            .map((propertyType) => propertyType.name + " " + property.id)
            .toList()
            .join(", ");
      }
    }

    return null; // Return null if the property name is not found
  } */

  String removeNumbersFromSuffix(String input) {
    // Use a regular expression to match the numeric part at the end of the string
    RegExp regExp = RegExp(r'\s\d+$');

    // Replace the numeric part with an empty string to remove it
    return input.replaceAll(regExp, '');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorConstant.gray50,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          height: (90),
          leadingWidth: 64,
          leading: AppbarIconbutton1(
              svgPath: ImageConstant.imgArrowleft,
              margin: EdgeInsets.only(left: 24),
              onTap: () {
                onTapArrowleft4(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Add Leads")),
      drawer: AppDrawer(
          //onLogout: handleLogout,
          ),
      /* floatingActionButton: CustomButton(
        height: 45,
        width: 155,
        text: "Manage Lead",
        margin: EdgeInsets.only(
          top: 25,
        ),
        onTap: () => Navigator.pushNamed(context, AppRoutes.myHomeEmptyScreen),
        shape: ButtonShape.RoundedBorder10,
        padding: ButtonPadding.PaddingAll13,
        fontStyle: ButtonFontStyle.ManropeBold14WhiteA700,
      ), */
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
              width: double.maxFinite,
              padding:
                  EdgeInsets.only(left: 24, top: 32, right: 24, bottom: 32),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 26),
                          child: Text("Customer Details",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeBold18
                                  .copyWith(letterSpacing: (0.2)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: nameController,
                          hintText: "Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }

                            return null;
                          },
                          margin: EdgeInsets.only(top: 13)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: phoneController,
                          hintText: "Phone",
                          validator: (value) {
                            RegExp regex = RegExp(r"^(?:\+91|0)?[6789]\d{9}$");

                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!regex.hasMatch(value)) {
                              return 'Enter valid number';
                            }
                            return null;
                          },
                          margin: EdgeInsets.only(top: 12),
                          textInputType: TextInputType.number),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: emailController,
                          hintText: "Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          margin: EdgeInsets.only(top: 12)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: addressController,
                          hintText: "Address",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }

                            return null;
                          },
                          margin: EdgeInsets.only(top: 12)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: cityController,
                          hintText: "City",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your city name';
                            }

                            return null;
                          },
                          margin: EdgeInsets.only(top: 12)),
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
                                    'Birthday Date ${_formatDate(birthdayDate)}',
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
                      GestureDetector(
                        onTap: () => _showAnniversaryDatePicker,
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
                                    'Anniversary Date ${_formatDate(anniversaryDate)}',
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
                      Padding(
                          padding: EdgeInsets.only(top: 26),
                          child: Text("Lead Details",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeBold18
                                  .copyWith(letterSpacing: (0.2)))),
                      /*   CustomDropDown(
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: EdgeInsets.only(left: 30, right: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownGray900)),
                          hintText: "Source",
                          margin: EdgeInsets.only(top: 12),
                          variant: DropDownVariant.FillBluegray50,
                          fontStyle:
                              DropDownFontStyle.ManropeMedium14Bluegray500,
                          items: dropdownItemListSource,
                          onChanged: (value) {}), */
                      CustomDropDown(
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: EdgeInsets.only(left: 30, right: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownGray900)),
                          hintText: "Preferred Project",
                          margin: EdgeInsets.only(top: 12),
                          variant: DropDownVariant.FillBluegray50,
                          fontStyle:
                              DropDownFontStyle.ManropeMedium14Bluegray500,
                          items: propertyNames,
                          errorText:
                              selectedProperty == null && showError == true
                                  ? "Please select preferred Project"
                                  : null,
                          onChanged: (value) {
                            setState(() {
                              selectedProperty = value;
                              locationName = null;
                              propertystatus = null;
                              String? location = findLocationName(value);
                              String? status = findPropertyStatus(value);
                              String? category = findCategory(value);
                              List<String>? type = findType(value);
                              // selectedValues = type!.split(',');
                              locationName = location;
                              categoryType = category;
                              propertystatus = status;
                              // propertyType = type;
                              propertytypeList = type!;
                              
                            });
                          }),
                      // showError ? Text("Select property") : Text(""),
                      CustomDropDown(
                          focusNode: FocusNode(),
                          value: locationName,
                          icon: Container(
                              margin: EdgeInsets.only(left: 30, right: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownGray900)),
                          hintText: "Property Location",
                          margin: EdgeInsets.only(top: 12),
                          variant: DropDownVariant.FillBluegray50,
                          fontStyle:
                              DropDownFontStyle.ManropeMedium14Bluegray500,
                          items: locationName != null ? [locationName!] : [],
                          onChanged: (value) {
                            setState(() {
                              locationName = value;
                            });
                          }),
                      CustomDropDown(
                          focusNode: FocusNode(),
                          value: categoryType,
                          icon: Container(
                              margin: EdgeInsets.only(left: 30, right: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownGray900)),
                          hintText: "Property Category",
                          margin: EdgeInsets.only(top: 12),
                          variant: DropDownVariant.FillBluegray50,
                          fontStyle:
                              DropDownFontStyle.ManropeMedium14Bluegray500,
                          items: categoryType != null ? [categoryType!] : [],
                          onChanged: (value) {
                            setState(() {
                              categoryType = value;
                            });
                          }),

                      selectedValues.isNotEmpty
                          ? Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  spacing: 8,
                                  children: selectedValues.map((value) {
                                    return Chip(
                                      backgroundColor: ColorConstant.blueGray50,
                                      label:
                                          Text(removeNumbersFromSuffix(value)),
                                      onDeleted: () => removeValue(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          : Container(),
                      /* selectedValues.isEmpty
                          ? CustomDropDown(
                              focusNode: FocusNode(),
                              value: propertyType,
                              icon: Container(
                                  margin: EdgeInsets.only(left: 30, right: 16),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgArrowdownGray900)),
                              hintText: "Property Type",
                              margin: EdgeInsets.only(top: 12),
                              variant: DropDownVariant.FillBluegray50,
                              fontStyle:
                                  DropDownFontStyle.ManropeMedium14Bluegray500,
                              items:
                                  propertyType != null ? [propertyType!] : [],
                              onChanged: (value) {
                                setState(() {
                                  propertyType = value;
                                });
                              })
                          : Container(), */
                      CustomDropDown(
                          focusNode: FocusNode(),
                          // value: propertystatus,
                          icon: Container(
                              margin: EdgeInsets.only(left: 30, right: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownGray900)),
                          hintText: "Property type",
                          margin: EdgeInsets.only(top: 12),
                          variant: DropDownVariant.FillBluegray50,
                          fontStyle:
                              DropDownFontStyle.ManropeMedium14Bluegray500,
                          items: propertytypeList,
                          errorText: propertyType == null && showError == true
                              ? "Please select property type"
                              : null,
                          onChanged: (value) {
                            setState(() {
                              propertyType = value;
                            });
                          }),
                      CustomDropDown(
                          focusNode: FocusNode(),
                          value: propertystatus,
                          icon: Container(
                              margin: EdgeInsets.only(left: 30, right: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownGray900)),
                          hintText: "Property Status",
                          margin: EdgeInsets.only(top: 12),
                          variant: DropDownVariant.FillBluegray50,
                          fontStyle:
                              DropDownFontStyle.ManropeMedium14Bluegray500,
                          items:
                              propertystatus != null ? [propertystatus!] : [],
                          onChanged: (value) {
                            setState(() {
                              propertystatus = value;
                            });
                          }),
                      CustomTextFormField(
                          maxLines: 5,
                          focusNode: FocusNode(),
                          controller: commentController,
                          hintText: "Comment",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter comments';
                            }

                            return null;
                          },
                          margin: EdgeInsets.only(top: 12, bottom: 5),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.multiline),
                      Padding(
                          padding: EdgeInsets.only(top: 26),
                          child: Text("Add Followup ",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeBold18
                                  .copyWith(letterSpacing: (0.2)))),
                      GestureDetector(
                          onTap: () => _selectDateTime(context),
                          child: Container(
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: ColorConstant.blueGray50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  selectedDateTime != null
                                      ? Text(
                                          'Selected Date & Time: ${formatDateTime(selectedDateTime!)}',
                                          style: TextStyle(
                                            color: ColorConstant.blueGray500,
                                            fontSize: 14,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w600,
                                            height: 1.43,
                                          ),
                                        )
                                      : Text('Select date and time',
                                          style: TextStyle(
                                            color: ColorConstant.blueGray500,
                                            fontSize: 14,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w600,
                                            height: 1.43,
                                          )),
                                ],
                              ),
                            ),
                          )),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: callTypeController,
                          hintText: "Call Type",
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter your call type';
                          //   }
                          //
                          //   return null;
                          // },
                          margin: EdgeInsets.only(top: 12)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: leadDesc,
                          hintText: "Description",
                          maxLines: 5,
                          textInputType: TextInputType.multiline,
                          margin: EdgeInsets.only(top: 12)),

                      CustomButton(
                          onTap: () async {
                            if (selectedProperty == null) {
                              setState(() {
                                showError = true;
                              });
                            }

                            if (_formKey.currentState!.validate()) {
                              // Form is valid, handle the login logic here
                              await EasyLoading.show(
                                  status: 'adding lead...',
                                  dismissOnTap: false);
                              AddLeadRequest addLeadRequest = AddLeadRequest(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                comment: commentController.text,
                                bdate: _formatDate(birthdayDate),
                                adate: _formatDate(anniversaryDate),
                                userId: user,
                                sourceId: "1",
                                propertyStatus: propertyStatusId,
                                locationId: locationId,
                                projectId: projectId,
                                categoryId: categoryId,
                                propertyType: getNumbersOnly(propertyType!),
                                dateTime: formatDateTime(selectedDateTime!),
                                description: leadDesc.text,
                                callType: callTypeController.text,
                                // '1', //later confirmed   Text(selectedValues.toString()),
                              );
                              String? result =
                                  await ApiService().addLeadApi(addLeadRequest);

                              if (result != null && result == 'true') {
                                await EasyLoading.dismiss();
                                await Navigator.pushNamed(context, AppRoutes.dash);
                              } else {
                                await EasyLoading.dismiss();
                                setState(() {
                                  showError = true;
                                });
                              }
                            }
                          },
                          height: (56),
                          text: "Add",
                          margin: EdgeInsets.only(top: 20),
                          shape: ButtonShape.RoundedBorder10,
                          padding: ButtonPadding.PaddingAll16,
                          fontStyle: ButtonFontStyle.ManropeBold16Gray50_1),
                      SizedBox(
                        height: 300,
                      )
                    ]),
              )),
        ),
      ),
    ));
  }

 void onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addNewPropertyMeetWithAAgentScreen);
  }

 void onTapArrowleft4(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myHomeEmptyScreen);
  }
}
