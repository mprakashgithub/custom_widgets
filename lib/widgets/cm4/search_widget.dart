import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController txtController = TextEditingController();
  String searchString = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: kElevationToShadow[4]),
      child: TextFormField(
        controller: txtController,
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        cursorColor: AppColors.red,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: AppStrings.txtSearchForConsultant,
          border: InputBorder.none,
          hintStyle: AppTextStyle.font16AsapMediumBlueDarkTextStyle,
          labelStyle: TextStyle(color: AppColors.white),
          contentPadding: EdgeInsets.only(top: 14, left: 10),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Image.asset(
              "assets/images/app_images/us_search_icon.png",
              fit: BoxFit.fill,
            ),
          ),
          suffixIcon: SizedBox(
            width: 106,
            child: Row(
              children: [
                Text(
                  AppStrings.txtBecome,
                  style: TextStyle(color: AppColors.red),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                          "assets/images/app_images/us_placeholder.png")),
                )
              ],
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {
            searchString = value.toLowerCase();
          });
        },
      ),
    );
  }
}
