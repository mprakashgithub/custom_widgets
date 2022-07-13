import 'package:clokworx/view/app_data/app_colors.dart';
import 'package:clokworx/view/app_data/app_strings.dart';
import 'package:clokworx/view/app_data/app_text_style.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  Widget nextButton(double? _width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(bottom: 30),
            height: 48,
            width: _width! * 0.4,
            decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: Text(AppStrings.txtNext,
                  style: AppTextStyle.font17AsapSemiBoldGreenTextStyle),
            ),
          ),
        ),
      ],
    );
  }

  TextEditingController emailController = TextEditingController();
  String? email;
  Widget stockTextFormField() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        cursorColor: AppColors.white,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
            hintText: 'Finish Stock Order',
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.lightYellow),
            labelStyle: TextStyle(color: AppColors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: AppColors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: AppColors.white),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: AppColors.white),
            ),
            suffixIcon: Icon(
              Icons.circle,
              color: AppColors.lightYellow,
            )),
        onChanged: (value) {
          email = value;
        },
      ),
    );
  }
}
