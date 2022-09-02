import 'package:flutter/material.dart';
import '../app_data/app_strings.dart';
import '../widgets/custom_buttom.dart';

class LecParams extends StatefulWidget {
  final String? lId, lName, vDate, applicantId, applicantname;
  const LecParams(
      {Key? key,
      this.lId,
      this.lName,
      this.vDate,
      this.applicantId,
      this.applicantname})
      : super(key: key);

  @override
  State<LecParams> createState() => _LecParamsState();
}

class _LecParamsState extends State<LecParams> {
  double? _width, _height;
  List selectedParams = [
    {"p_name": "Earth filling reqd.", "selected_val": ""},
    {"p_name": "Earth/rock cutting reqd.", "selected_val": ""},
    {"p_name": "LT O/H Line", "selected_val": ""},
    {"p_name": "O/H Tel.Line", "selected_val": ""},
    {"p_name": "Trees", "selected_val": ""},
    {
      "p_name": "Proximity to culvert (farther from culvert desirable)",
      "selected_val": ""
    },
    {"p_name": "Soil Type (Soft)", "selected_val": ""},
    {"p_name": "Availability of Power", "selected_val": ""},
    {"p_name": "Availability of Water", "selected_val": ""},
    {"p_name": "Visibility from Road", "selected_val": ""},
    {"p_name": "No Presence of Divider", "selected_val": ""},
    {"p_name": "Outside Octroi Limits", "selected_val": ""},
  ];

  List<String> paramVal = ["Yes", "No", "NA"];

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.txtLECParameters,
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
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
              paramHeader(),
              radioOption()
              // paramWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding:
              const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
          child: CustomButton(
              buttonColor: AppColors.orange,
              onClick: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PendingPhotoUpload(
                            lId: widget.lId,
                            lName: widget.lName,
                            vDate: widget.vDate,
                            applicantId: widget.applicantId,
                            applicantname: widget.applicantname
                            // paramsVal: selectedParams[0][""],
                            ))));
              }),
              text: Text(
                AppStrings.txtNext,
                style: AppTextStyle.font14OpenSansBoldWhiteTextStyle,
              ))),
    ));
  }

  Widget paramHeader() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.txtLECParameters,
            style: AppTextStyle.font14OpenSansBoldLightGreenTextStyle,
          ),
          SizedBox(
            width: _width! * 0.50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppStrings.txtYes,
                  style: AppTextStyle.font14OpenSansBoldLightGreenTextStyle,
                ),
                Text(
                  AppStrings.txtNo,
                  style: AppTextStyle.font14OpenSansBoldLightGreenTextStyle,
                ),
                Text(
                  AppStrings.txtNA,
                  style: AppTextStyle.font14OpenSansBoldLightGreenTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget radioOption() {
    return Container(
      height: _height! * 0.52,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
          itemCount: selectedParams.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: _width! * 0.45,
                    child: Text(selectedParams[index]["p_name"])),
                Container(
                  width: _width! * 0.48,
                  padding: const EdgeInsets.only(left: 0, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                          value: paramVal[0],
                          activeColor: AppColors.orange,
                          groupValue: selectedParams[index]["selected_val"],
                          onChanged: (value) {
                            setState(() {
                              selectedParams[index]["selected_val"] =
                                  value.toString();
                              debugPrint(
                                  "Selected val: ${selectedParams[index]["selected_val"]}");
                            });
                          }),
                      Radio(
                          value: paramVal[1],
                          activeColor: AppColors.orange,
                          groupValue: selectedParams[index]["selected_val"],
                          onChanged: (value) {
                            setState(() {
                              selectedParams[index]["selected_val"] =
                                  value.toString();
                            });
                            debugPrint(
                                "Selected val: ${selectedParams[index]["selected_val"]}");
                          }),
                      Radio(
                          value: paramVal[2],
                          activeColor: AppColors.orange,
                          groupValue: selectedParams[index]["selected_val"],
                          onChanged: (value) {
                            setState(() {
                              selectedParams[index]["selected_val"] =
                                  value.toString();
                            });
                            debugPrint(
                                "Selected val: ${selectedParams[index]["selected_val"]}");
                          }),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
