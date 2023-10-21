import 'package:crm/core/api/api_service.dart';
import 'package:crm/core/app_export.dart';
import 'package:crm/core/model/get_leads_response.dart';
import 'package:crm/core/model/total_count_response.dart';
import 'package:crm/core/model/total_leads_model.dart';
import 'package:crm/core/model/wone_leads_model.dart';
import 'package:crm/presentation/app_drawer.dart';
import 'package:crm/widgets/app_bar/appbar_title.dart';
import 'package:crm/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:crm/widgets/app_bar/appbar_iconbutton_1.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
  List<String> dropdownItemList2 = ["Item One", "Item Two", "Item Three"];
  List<String> dropdownItemList3 = ["Item One", "Item Two", "Item Three"];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GetLeadsResponse? getLeadsResponse;

  void openAppDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  String flupLeadCount = "0";
  String woneledsCount = "0";
  bool timeOut = false;
  TotalCountResponse? totalCountResponse;
  TotalLeads? totalLeads;
  WonLedsModel? woneLeds;

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
    //print('User logged out');
  }

  @override
  void initState() {
    super.initState();
    getCount();
    getTodaysFollouplead();
    getCount2();
  }

  void getCount2() async {
    woneLeds = await ApiService().fetchWoneLeads();
    // totalLeads = await ApiService().fetchFollowupData();
    // print(totalLeads!.data!.first.dateTime);
    if (woneLeds != null) {
      setState(() {
        if (woneLeds!.data!.length != 0) {
          woneledsCount = woneLeds!.data!.length.toString();
        } else {
          woneledsCount = "0";
        }
        print('woneledsCount');
        print(woneLeds!.data);
      });
    } else {
      setState(() {
        timeOut = true;
      });
    }

  }
  // void getCount1() async {
  //   totalLeads = await ApiService().fetchTodaysFollowupLeads();
  //   // totalLeads = await ApiService().fetchFollowupData();
  //   // print(totalLeads!.data!.first.dateTime);
  //   if (totalLeads != null) {
  //     setState(() {
  //       if (totalLeads!.data!.length != 0) {
  //         flupLeadCount = totalLeads!.data!.length.toString();
  //       } else {
  //         flupLeadCount = "0";
  //       }
  //     });
  //     print('flupLeadCount');
  //     print(flupLeadCount);
  //   } else {
  //     setState(() {
  //       timeOut = true;
  //     });
  //   }
  // }
  void getTodaysFollouplead() async {
    totalLeads = await ApiService().fetchTodaysFollowupLeads();
    if (totalLeads != null) {
        if (totalLeads != null) {
              setState(() {
                if (totalLeads!.data!.length != 0) {
                  flupLeadCount = totalLeads!.data!.length.toString();
                } else {
                  flupLeadCount = "0";
                }
              });
              print('flupLeadCount');
              print(flupLeadCount);
    } else {
      setState(() {
        timeOut = true;
      });
    }
  }
  }
  void getCount() async {
    totalCountResponse = await ApiService().fetchAllCount();
    if (totalCountResponse != null) {
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4.5;
    final double itemWidth = size.width / 2;
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
              title: AppbarTitle(text: "Dashboard")),
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
                  SizedBox(
                    height: 20,
                  ),
                  // SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  //   child: buildfollowupleads("Today's Follow Up Leads",
                  //       Icons.leaderboard_outlined, flupLeadCount)),
                  SizedBox(
                    height: 900,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid

                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return buildTile(context, index, onTap: () {
                          // Handle the tap event for each tile
                          // print('${fieldNames[index]} tile tapped.');
                        });
                      },
                    ),
                  ),

                  /*   SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: ColorConstant.blueGray50,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Id')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Mobile')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Status')),
                          DataColumn(
                              label: Text(
                                  'Action')), // You can customize this column
                        ],
                        rows: tableData.map((data) {
                          return DataRow(
                            cells: [
                              DataCell(Text(data['id'].toString())),
                              DataCell(Text(data['name'])),
                              DataCell(Text(data['mobile'])),
                              DataCell(Text(data['email'])),
                              DataCell(Text(data['status'])),
                              DataCell(
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Handle copy action here
                                        print(
                                            'Copy action for Id: ${data['id']}');
                                      },
                                      child: Icon(Icons.copy),
                                    ),
                                    SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        // Handle delete action here
                                        print(
                                            'Delete action for Id: ${data['id']}');
                                      },
                                      child: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ), */
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          /* floatingActionButton: CustomButton(
            height: getVerticalSize(
              45,
            ),
            width: getHorizontalSize(
              155,
            ),
            text: "Add Lead",
            margin: getMargin(
              top: 25,
            ),
            onTap: () => Navigator.pushNamed(
                context, AppRoutes.addNewPropertyAddressScreen),
            shape: ButtonShape.RoundedBorder10,
            padding: ButtonPadding.PaddingAll13,
            fontStyle: ButtonFontStyle.ManropeBold14WhiteA700,
          ), */
          /*  bottomNavigationBar: CustomBottomBar(
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
          ), */
        ),
      ),
    );
  }

  Widget buildTile(BuildContext context, int index, {VoidCallback? onTap}) {
    // Define your fields and corresponding icons here
    List<String> fieldNames = [
      'Total Leads',
      'Lost Leads ',
      'Executive Leads',
      'Follow-up Lead',
      'New Leads',
      'Add Lead',
      'Today\'s Follow Up Leads',
      'Won Leads'
    ];

    List<IconData> icons = [
      Icons.bar_chart,
      Icons.done,
      Icons.assignment_ind,
      Icons.schedule,
      Icons.assignment_ind_outlined,
      Icons.add_circle,
      Icons.leaderboard_outlined,
      Icons.leaderboard_outlined,
    ];

    List<Color> flutterColors = [
      Color.fromARGB(255, 255, 219, 215),
      const Color.fromARGB(255, 194, 230, 195),
      const Color.fromARGB(255, 255, 251, 215),
      const Color.fromARGB(255, 233, 248, 255),
      Color.fromARGB(255, 249, 244, 250),
      const Color.fromARGB(255, 221, 251, 255),
      Colors.teal,
      const Color.fromARGB(255, 194, 230, 195),
    ];

    return Card(
      color: flutterColors[index],
      shadowColor: ColorConstant.blue500,
      child: InkWell(
        onTap: () {
          // Handle the tap event for each tile
          if (fieldNames[index] == 'Leads') {
            Navigator.pushNamed(context, AppRoutes.myHomeEmptyScreen);
          }
          if (fieldNames[index] == 'Follow-up Lead') {
            Navigator.pushNamed(context, AppRoutes.followLeadScreen);
          }

          if (fieldNames[index] == 'Total Leads') {
            Navigator.pushNamed(context, AppRoutes.totalScreen);
          }
          if (fieldNames[index] == 'Lost Leads ') {
            Navigator.pushNamed(context, AppRoutes.lostScreen);
          }
          if (fieldNames[index] == 'Executive Leads') {
            Navigator.pushNamed(context, AppRoutes.assignScreen);
          }
          if (fieldNames[index] == 'New Leads') {
            Navigator.pushNamed(context, AppRoutes.newScreen);
          }
          if (fieldNames[index] == 'Add Lead') {
            Navigator.pushNamed(context, AppRoutes.addNewPropertyAddressScreen);
          }
          if (fieldNames[index] == 'Today\'s Follow Up Leads') {
            Navigator.pushNamed(context, AppRoutes.todaysfollowLeadScreen);
          }
          if (fieldNames[index] == 'Won Leads') {
            Navigator.pushNamed(context, AppRoutes.wonLeads);
          } else {
            // Handle other tiles' tap events here if needed
            // For now, we'll just print the field name.
            // print('${fieldNames[index]} tile tapped.');
          }
        }, // Call the onTap callback when the tile is tapped
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons[index], size: 35),
            SizedBox(height: 8),
            totalCountResponse != null
                ? Text(
                    index == 0
                        ? totalCountResponse!.data!.totalLeads!.toString()
                        : index == 1
                            ? totalCountResponse!.data!.totalLostLeads!
                                .toString()
                            : index == 2
                                ? totalCountResponse!.data!.totalExecutiveLeads!
                                    .toString()
                                : index == 3
                                    ? totalCountResponse!
                                        .data!.totalFollowupLeads!
                                        .toString()
                                    : index == 4
                                        ? totalCountResponse!
                                            .data!.totalNewLeads!
                                            .toString()
                                        : index == 6
                                            ? flupLeadCount
                                                .toString()
                                            : index == 7
                                                ? woneledsCount
                                                    .toString()
                                                : totalCountResponse!
                                                    .data!.totalWonLeads!
                                                    .toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 28, 48)),
                  )
                : CircularProgressIndicator(),
            Text(
              fieldNames[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildfollowupleads(String label, IconData icon, String count) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.todaysfollowLeadScreen);
      },
      child: count != null
          ? Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              // elevation: 5,
              margin: EdgeInsets.all(10),
              child: Container(
                color: Colors.teal,

                height: 150, // Fixed height
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 36,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    totalLeads != null
                        ? Text(
                            flupLeadCount,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                        : CircularProgressIndicator(
                            color: Colors.white,
                          ),
                    Text(
                      label,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
