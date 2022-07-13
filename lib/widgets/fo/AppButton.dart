import 'package:flutter/material.dart';
import 'package:forke/constants/AppColors.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onClick;
  EdgeInsets margin;
  Color backColor;

  AppButton({Key key, this.text, this.margin, this.onClick, this.backColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        splashColor: AppColors.white.withOpacity(0.2),
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
                color: backColor != null ? backColor : AppColors.colorPrimary)),
        child: Text(
          text,
          style: TextStyle(color: AppColors.white),
        ),
        color: AppColors.colorPrimary,
        onPressed: onClick,
      ),
      margin: margin,
    );
  }
}
