import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lec/view/app_data/app_colors.dart';
import 'package:lec/view/app_data/app_dialogs.dart';
import 'package:lec/view/app_data/app_strings.dart';
import 'package:lec/view/app_data/app_text_style.dart';

import '../widgets/custom_buttom.dart';

class ReportUpload extends StatefulWidget {
  final String? lId, lName, vDate, applicantId, applicantname;
  const ReportUpload(
      {Key? key,
      this.lId,
      this.lName,
      this.vDate,
      this.applicantId,
      this.applicantname})
      : super(key: key);

  @override
  State<ReportUpload> createState() => ReportUploadState();
}

class ReportUploadState extends State<ReportUpload> {
  double? _height, _width;
  File? selectedFile;
  String? splitedSelected;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            AppStrings.txtLECReportUpload,
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
        body: SingleChildScrollView(
          child: SizedBox(
            // height: _height,
            width: _width,
            child: Column(
              children: [
                Card(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  elevation: 8,
                  color: AppColors.lightGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    // color: AppColors.appGrey,
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
                              "${widget.lId}",
                              style: AppTextStyle
                                  .font14OpenSansRegularWhiteTextStyle,
                            ),
                            Text(
                              "${widget.lName}",
                              style: AppTextStyle
                                  .font14OpenSansRegularWhiteTextStyle,
                            ),
                            Text(
                              "${widget.vDate}",
                              style: AppTextStyle
                                  .font14OpenSansRegularWhiteTextStyle,
                            ),
                            Text(
                              "${widget.applicantId}",
                              style: AppTextStyle
                                  .font14OpenSansRegularWhiteTextStyle,
                            ),
                            Text(
                              "${widget.applicantname}",
                              style: AppTextStyle
                                  .font14OpenSansRegularWhiteTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Container(
                  height: _height! * 0.20,
                  // color: AppColors.white,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    cursorColor: AppColors.orange,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(10)),
                      focusColor: AppColors.orange,
                      hintText: AppStrings.txtImportantRemarks,
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: Text(
                      AppStrings.txtLECReportUpload,
                      style: AppTextStyle.font12OpenSansBoldOrangeTextStyle,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // image == null
                    //     ?
                    selectedFile == null
                        ? const Text(AppStrings.txtNoDocSelected)
                        : Text(splitedSelected!),

                    CustomButton(
                        buttonColor: AppColors.orange,
                        onClick: () async {
                          // openImageDialog(context);
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path!);
                            debugPrint(file.path);
                            setState(() {
                              selectedFile = file;
                              splitedSelected = file.path.split('/').last;
                            });
                          } else {
                            //
                          }
                        },
                        buttonHeight: 30,
                        buttonWidth: 100,
                        text: Text(
                          AppStrings.txtUpload,
                          style:
                              AppTextStyle.font14OpenSansRegularWhiteTextStyle,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomButton(
              buttonColor: AppColors.orange,
              onClick: () {
                AppDialogs.openThankYouDialog(context);
                // Future.delayed(const Duration(seconds: 5), () {
                //   Navigator.pop(context);
                // });
              },
              text: Text(
                AppStrings.txtSubmit,
                style: AppTextStyle.font14OpenSansBoldWhiteTextStyle,
              )),
        ),
      ),
    ));
  }
}
