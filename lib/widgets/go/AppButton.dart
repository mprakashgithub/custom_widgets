
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergohylogistics/helper/AppColors.dart';
import 'package:fluttergohylogistics/localization/AppLocalization.dart';

class AppButton extends StatefulWidget {
  String text;
  TextStyle textStyle;
  TextStyle textStyle2;

  double fontSize;
  EdgeInsets padding;
  EdgeInsets margin;
  Function onPressed;
  Color buttonBackground = AppColors.buttonColor;
  Color textColor = AppColors.white;
  FontWeight fontWeight = FontWeight.w100;

  AppButton(
      {Key key,
      this.text,
      this.textStyle,
      this.fontWeight,
      this.fontSize,
      this.onPressed,
      this.textColor,
      this.padding,
        this.margin,
      this.buttonBackground})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppButtonState();
  }
}

class AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: widget.padding,
        margin: widget.margin,
        child: RaisedButton(

          onPressed: widget.onPressed,
          color: widget.buttonBackground,
          child: Text(
            (AppLocalization.of(context).translate(widget.text) != null
                ? AppLocalization.of(context).translate(widget.text)
                : widget.text),
            style: TextStyle(
                color: widget.textColor,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                fontFamily: "MyriadPro"),
          ),
        ));
  }
}
