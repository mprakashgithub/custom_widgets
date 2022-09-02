import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_strings.dart';
import 'app_text_style.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.black.withOpacity(0.2),
      padding: const EdgeInsets.all(20),
      child: Center(
          child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey, width: 1),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  AppStrings.txtPleaseWait,
                  style: AppTextStyle.font16OpenSansRegularRedTextStyle,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
