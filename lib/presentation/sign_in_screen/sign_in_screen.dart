import 'package:crm/core/api/api_service.dart';
import 'package:crm/core/app_export.dart';
import 'package:crm/core/model/login_request.dart';
import 'package:crm/widgets/custom_button.dart';
import 'package:crm/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// ignore_for_file: must_be_immutable

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController =
      TextEditingController(text: "admin@demo.com");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController passwordController =
      TextEditingController(text: "roongtansk@1231\$");
  bool showError = false;

  bool isObscure = true;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 24, top: 39, right: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Welcome!",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeExtraBold24)),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 9),
                                  child: Text("Sign in to your account",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManrope16
                                          .copyWith(letterSpacing: (0.3))))),
                          CustomTextFormField(
                              focusNode: _emailFocus,
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              hintText: "Email",
                              margin: EdgeInsets.only(top: 20),
                              textInputType: TextInputType.emailAddress),
                          CustomTextFormField(
                            focusNode: _passwordFocus,
                            controller: passwordController,
                            hintText: "Password",
                            margin: EdgeInsets.only(top: 16),
                            padding: TextFormFieldPadding.PaddingT14,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            isObscureText: isObscure,
                            textInputType: TextInputType.visiblePassword,
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() => isObscure = !isObscure);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 30, top: 15, right: 16, bottom: 14),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgEye)),
                            ),
                            suffixConstraints: BoxConstraints(maxHeight: (49)),
                          ),
                          CustomButton(
                              onTap: () {
                                onTapTxtSignup(context);
                              },
                              height: (56),
                              text: "Sign In",
                              margin: EdgeInsets.only(top: 20),
                              shape: ButtonShape.RoundedBorder10,
                              padding: ButtonPadding.PaddingAll16,
                              fontStyle: ButtonFontStyle.ManropeBold16Gray50_1),
                          SizedBox(
                            height: 20,
                          ),
                          showError == true
                              ? Text("Login Failed",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeExtraBold18
                                      .copyWith(color: Colors.red))
                              : Container(),
                          SizedBox(
                            height: 400,
                          )
                        ]),
                  )),
            )));
  }

  void onTapTxtSignup(BuildContext context) async {
    _emailFocus.unfocus();
    _passwordFocus.unfocus();
    //  Navigator.pushNamed(context, AppRoutes.myHomeEmptyScreen);
    if (_formKey.currentState!.validate()) {
      // Form is valid, handle the login logic here
      await EasyLoading.show(status: 'logging in...', dismissOnTap: false);
      LoginRequest loginRequest = LoginRequest(
          email: emailController.text, password: passwordController.text);
      var result = await ApiService().loginUser(loginRequest);

      if (result != null &&
          result.status == 'true' &&
          result.userType == "admin") {
        await EasyLoading.dismiss();
        await Navigator.pushNamed(context, AppRoutes.dash);
      } else {
        await EasyLoading.dismiss();
        setState(() {
          showError = true;
        });
      }
      emailController.clear();
      passwordController.clear();
    }
  }
}
