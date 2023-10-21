import 'package:crm/core/api/api_service.dart';
import 'package:crm/core/app_export.dart';
import 'package:crm/core/model/get_leads_response.dart';
import 'package:crm/presentation/app_drawer.dart';
import 'package:crm/presentation/my_home_empty_screen/time_out.dart';
import 'package:crm/presentation/profile_page/profile_page.dart';
import 'package:crm/widgets/app_bar/appbar_title.dart';
import 'package:crm/widgets/app_bar/custom_app_bar.dart';
import 'package:crm/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:crm/widgets/app_bar/appbar_iconbutton_1.dart';

class LostScreen extends StatefulWidget {
  const LostScreen({Key? key}) : super(key: key);

  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
  List<String> dropdownItemList2 = ["Item One", "Item Two", "Item Three"];
  List<String> dropdownItemList3 = ["Item One", "Item Two", "Item Three"];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GetLeadsResponse? getLeadsResponse;
  bool timeOut = false;

  void openAppDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  final List<Map<String, dynamic>> tableData = [
    {
      'id': 1,
      'name': 'John Doe',
      'mobile': '1234567890',
      'email': 'john.doe@example.com',
      'status': 'Active',
    },
    {
      'id': 2,
      'name': 'Jane Smith',
      'mobile': '9876543210',
      'email': 'jane.smith@example.com',
      'status': 'Inactive',
    },
    {
      'id': 3,
      'name': 'Smith',
      'mobile': '9876543210',
      'email': 'jane.smith@example.com',
      'status': 'Inactive',
    },
    {
      'id': 4,
      'name': 'Marcus',
      'mobile': '9876543210',
      'email': 'jane.smith@example.com',
      'status': 'Inactive',
    },
    // Add more data rows as needed
  ];

  void handleLogout() {
    // Implement your logout logic here
    // For example, clear user session and navigate to login screen
    // ...
   // print('User logged out');
  }

  @override
  void initState() {
    super.initState();
    getLeads();
  }

  void getLeads() async {
    getLeadsResponse = await ApiService().lostLeadApi();
    if (getLeadsResponse != null) {
      setState(() {});
    } else {
      setState(() {
        timeOut = true;
      });
    }
  }

  void _removeKeyboard(BuildContext context) {
    // Unfocus the text field
    FocusScope.of(context).unfocus();
  }

  String convertToDDMMYYYY(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _removeKeyboard(context); // Call this function to remove the keyboard
      },
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: ColorConstant.whiteA700,
          appBar: CustomAppBar(
              height: (90),
              leadingWidth: 64,
              leading: AppbarIconbutton1(
                  svgPath: ImageConstant.imgMenu,
                  margin: EdgeInsets.only(left: 24),
                  onTap: openAppDrawer),
              centerTitle: true,
              title: AppbarTitle(text: "Lost leads")),
          drawer: AppDrawer(
              //onLogout: handleLogout,
              ),
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getLeadsResponse != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: getLeadsResponse!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            //  var reversedIndex = getLeadsResponse!.data!.length - index - 1;
                            var item = getLeadsResponse!.data![index];

                              return  item != null?GestureDetector(
                                onTap: () {
                                      item.name != null ?
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(
                                        getLeadsResponse: item,
                                      ),
                                    ),
                                  ): Container();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    shadowColor: ColorConstant.blue500,
                                    color: const Color.fromARGB(
                                        255, 194, 230, 195),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Set the border radius here
                                    ),
                                    elevation: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 10, 16, 4),
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.blue,
                                                  size: 15,
                                                ),
                                              ),
                                              Text(item.name??'',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtManropeSemiBold14Gray900),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 10, 16, 4),
                                                child: Icon(
                                                  Icons.calendar_today,
                                                  color: Colors.blue,
                                                  size: 15,
                                                ),
                                              ),
                                              Text(
                                                  item.insertDate != null?
                                                  convertToDDMMYYYY(
                                                      item.insertDate!):'',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtManropeSemiBold14Gray900),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 10, 16, 6),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Colors.blue,
                                                  size: 15,
                                                ),
                                              ),
                                              Text(item.phone??'',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtManropeSemiBold14Gray900),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ):Container();

                            // return null;
                          },
                        )
                      : CircularProgressIndicator(),
                  timeOut == true ? TimeoutWidget() : Container(),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomBar(
            onChanged: (BottomBarEnum type) {
              switch (type) {
                case BottomBarEnum.Home:
                  Navigator.pushNamed(context, AppRoutes.myHomeEmptyScreen);
                  break;
                case BottomBarEnum.Myhome:
                  Navigator.pushNamed(
                      context, AppRoutes.addNewPropertyAddressScreen);
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
