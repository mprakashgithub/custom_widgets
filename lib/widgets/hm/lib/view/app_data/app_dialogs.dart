import 'package:flutter/material.dart';
import 'package:lec/view/app_data/app_text_style.dart';

import 'app_colors.dart';

class AppDialogs {
  ///Withdraw Dialog
  static Future openThankYouDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2)), //this right here
            child: Container(
              height: 180,
              // width: 180,
              width: MediaQuery.of(context).size.width * 0.90,
              // padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Thank you",
                        style:
                            AppTextStyle.font18OpenSansExtraboldPurpleTextStyle,
                      )),
                ],
              ),
            ),
          );
        });
  }
}
