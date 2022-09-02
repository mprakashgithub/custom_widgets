import 'package:flutter/material.dart';
import 'package:lec/view/app_data/app_colors.dart';
import 'package:lec/view/app_data/app_strings.dart';
import 'package:lec/view/app_data/app_text_style.dart';
import 'package:lec/view/widgets/custom_buttom.dart';

class PendComp extends StatefulWidget {
  const PendComp({Key? key}) : super(key: key);

  @override
  State<PendComp> createState() => _PendCompState();
}

class _PendCompState extends State<PendComp> {
  double? _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          height: _height,
          width: _width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                  buttonHeight: 100,
                  buttonWidth: 150,
                  buttonColor: AppColors.orange,
                  onClick: () {
                    Navigator.pushNamed(
                        context, AppStrings.routeToLecPendingList);
                  },
                  text: Text(
                    AppStrings.txtLECPendingList,
                    style: AppTextStyle.font12OpenSansRegularWhiteTextStyle,
                  )),
              CustomButton(
                  buttonHeight: 100,
                  buttonWidth: 150,
                  buttonColor: AppColors.orange,
                  onClick: () {
                    Navigator.pushNamed(
                        context, AppStrings.routeToLecCompletedList);
                  },
                  text: Text(AppStrings.txtLECCompletedList,
                      style: AppTextStyle.font12OpenSansRegularWhiteTextStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
