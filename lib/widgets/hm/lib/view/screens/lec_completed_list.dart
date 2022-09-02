import 'package:flutter/material.dart';
import 'package:lec/view/app_data/app_colors.dart';
import 'package:lec/view/app_data/app_strings.dart';
import 'package:lec/view/app_data/app_text_style.dart';

import '../../model/models/lec_pending_model.dart';

class LecCompletedList extends StatefulWidget {
  const LecCompletedList({Key? key}) : super(key: key);

  @override
  State<LecCompletedList> createState() => _LecCompletedListState();
}

class _LecCompletedListState extends State<LecCompletedList> {
  double? _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.txtLECCompletedList,
          style: AppTextStyle.font12OpenSansBoldOrangeTextStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            )),
        elevation: 0,
      ),
      body: SizedBox(
        height: _height,
        width: _width,
        child: ListView.builder(
            itemCount: pendingModelData.length,
            itemBuilder: ((context, index) {
              return Card(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                elevation: 8,
                color: AppColors.lightGreen,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${AppStrings.txtLocationID}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${AppStrings.txtLocationName}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${AppStrings.txtLECVisitDate}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${AppStrings.txtApplicantID}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${AppStrings.txtApplicantName}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pendingModelData[index].lId!,
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            pendingModelData[index].lName!,
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            pendingModelData[index].vDate!,
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            pendingModelData[index].applicantId!,
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            pendingModelData[index].applicantName!,
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
    ));
  }
}
