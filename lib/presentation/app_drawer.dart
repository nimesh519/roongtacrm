import 'package:crm/core/api/data_store.dart';
import 'package:crm/core/utils/color_constant.dart';
import 'package:crm/routes/app_routes.dart';
import 'package:crm/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

import 'package:crm/core/utils/image_constant.dart';

class AppDrawer extends StatelessWidget {
  //final VoidCallback onLogout;

  AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorConstant.teal900,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgLogo,
              height: 50,
              width: 50,
              margin: EdgeInsets.only(
                bottom: 5,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(context, AppRoutes.dash); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.leaderboard),
            title: Text('Manage lead'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(
                  context, AppRoutes.myHomeEmptyScreen); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.touch_app_outlined),
            title: Text('Total Leads'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(
                  context, AppRoutes.totalScreen); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.kayaking),
            title: Text('Closed lead'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(
                  context, AppRoutes.lostScreen); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.touch_app_outlined),
            title: Text('Executive Leads'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(
                  context, AppRoutes.assignScreen); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.touch_app_outlined),
            title: Text('Today\'s Follow Up Leads'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(
                  context, AppRoutes.todaysfollowLeadScreen); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.touch_app_outlined),
            title: Text('Follow Up Leads'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(
                  context, AppRoutes.followLeadScreen); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.balance_outlined),
            title: Text('New Leads'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(
                  context, AppRoutes.newScreen); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.addchart),
            title: Text('Add Lead'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(context,
                  AppRoutes.addNewPropertyAddressScreen); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.addchart),
            title: Text('Won Leads'),
            onTap: () {
              // Handle navigation to home screen here
              Navigator.pushNamed(context,
                  AppRoutes.wonLeads); // Close the drawer
            },
          ),
          // Add more ListTile items for other drawer options

          // Logout Button
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout logic here
              DataStore.saveUserLoginState(false);
              DataStore.clearSharedPreferences();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushNamed(context, AppRoutes.signInScreen);
            },
          ),
        ],
      ),
    );
  }
}
