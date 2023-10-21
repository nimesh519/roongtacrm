import 'package:crm/core/api/data_store.dart';
import 'package:crm/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () async {
      //Navigator.pushNamed(context, AppRoutes.signInScreen);
      // Navigator.pushNamed(context, AppRoutes.myHomePage);
      bool isLoggedIN = await DataStore.getUserLoginState();
      if (isLoggedIN) {
        await Navigator.pushNamed(context, AppRoutes.dash);
      } else {
        await Navigator.pushNamed(context, AppRoutes.signInScreen);
        // Navigator.pushNamed(context, AppRoutes.myHomeEmptyScreen);
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.teal900,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 250,
                width: 250,
                margin: EdgeInsets.only(
                  bottom: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
