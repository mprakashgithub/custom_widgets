import 'package:flutter/material.dart';
import 'package:fluttergohylogistics/appWidgets/AppText.dart';
import 'package:fluttergohylogistics/helper/AppColors.dart';
import 'package:fluttergohylogistics/helper/AppConstants.dart';

class MyAppBar extends AppBar{

  MyAppBar()
      : super(
      elevation: 0,
      centerTitle: true,
      title:new Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                  color: AppColors.white,
                  style: BorderStyle.solid,
                  width: 0.80),
            ),
            child: AppText(
              text: "warehouse" != null ?  "warehouse":"",
              fontSize: 16.0,
              textColor: AppColors.white,
              textAlign: TextAlign.center,
            ),
          ),
          AppText(
            text:AppConstants.drawerStock,
            fontSize: 16.0,
            textColor: AppColors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      leading:Builder(
      builder: (BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
          size: 20,),
        onPressed: () {
      },);}),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
          color: Colors.white,
        )
      ]);

}