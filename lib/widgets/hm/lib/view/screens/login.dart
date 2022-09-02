import 'package:flutter/material.dart';
import '../app_data/app_colors.dart';
import '../app_data/app_strings.dart';
import '../app_data/app_text_style.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double? _height;
  double? _width;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? userName, password;
  bool value = false;
  bool isVisible = false;
  Icon? visibleIcon;

  @override
  void initState() {
    super.initState();
    // isVisible = true;
    visibleIcon = isVisible == true
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body:
          //  Consumer<GenerateOtpForLoginProvider>(
          //     builder: (context, provider, child) {
          // return
          GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: _height,
          width: _width,

          // margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.only(top: 70),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: _height! * 0.01),
                appLogoWidget(),
                SizedBox(height: _height! * 0.04),
                userNamePasswordWidget(),
                SizedBox(height: _height! * 0.01),
                forgotPassword(),
                SizedBox(height: _height! * 0.06),
                CustomButton(
                  text: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.txtLogin,
                        style: AppTextStyle.font14OpenSansBoldWhiteTextStyle,
                      ),
                      Image.asset(
                        "assets/icons/click_ic.png",
                        height: 35,
                      ),
                    ],
                  ),
                  // buttonHeight: 45,
                  buttonColor: AppColors.orange,
                  onClick: () async {
                    if (userName != null && password != null) {
                      // await provider.generateOtpPostApi(userName!);
                      // print(
                      //     "login: ${provider.generateOtpForLoginModel!.data!.country}");
                      // if (provider.generateOtpForLoginModel!.data!.status ==
                      //     "success") {
                      Navigator.pushNamed(context, AppStrings.routeToPendComp);
                      // }
                    } else {
                      final snackBar = SnackBar(
                        content: Text(
                          AppStrings.txtPleaseCheckUsernameOrPassword,
                          style: AppTextStyle.font12OpenSansRegularRedTextStyle,
                        ),
                        backgroundColor: (AppColors.black),
                        duration: const Duration(seconds: 1),
                        action: SnackBarAction(
                          label: AppStrings.txtDismiss,
                          textColor: AppColors.red,
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
    // }));
  }

  Widget appLogoWidget() {
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.asset(
        "assets/images/hmel_logo.png",
        // color: AppColors.red,
      ),
    );
  }

  Widget userNamePasswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(AppStrings.txtUsername),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
          height: 48,
          child: TextFormField(
            controller: userNameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.person,
                color: AppColors.orange,
              ),
              labelText: AppStrings.txtUsername,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10)),
              border: const OutlineInputBorder(),
            ),
            onChanged: (input) {
              setState(() {
                userName = input;
              });
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(AppStrings.txtPassword),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
          height: 48,
          child: TextFormField(
            controller: passwordController,
            obscureText: !isVisible,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppColors.orange,
                ),
                labelText: AppStrings.txtPassword,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(10)),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  color: AppColors.grey,
                  icon: visibleIcon!,
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                      visibleIcon = isVisible == true
                          ? const Icon(
                              Icons.visibility,
                              color: AppColors.orange,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: AppColors.grey,
                            );
                    });
                  },
                )),
            onChanged: (input) {
              setState(() {
                password = input;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget forgotPassword() {
    return Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          AppStrings.txtForgotPassword,
          style: AppTextStyle.font12OpenSansBoldBlueTextStyle,
        ));
  }
}
