import 'package:flutter/material.dart';

class AppText extends StatefulWidget {
  String text;
  Color textColor = AppColors.white;
  double fontSize;
  FontWeight fontWeight;
  TextAlign textAlign;
  EdgeInsets margin;
  EdgeInsets padding;
  Color backColor;
  int maxLines;

  AppText(
      {Key key,
      this.textColor,
      this.text,
      this.fontWeight,
      this.fontSize,
      this.textAlign,
      this.margin,
      this.padding,
      this.backColor,
      this.maxLines})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppTextState();
  }
}

class AppTextState extends State<AppText> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: widget.margin,
        padding: widget.padding,
        color: widget.backColor,
        child: Text(
          (AppLocalization.of(context).translate(widget.text) != null
              ? AppLocalization.of(context).translate(widget.text)
              : widget.text),
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          style: TextStyle(
              color: widget.textColor,
              fontFamily: "MyriadPro", //fontFamily: "Roboto",
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize),
        ));
  }
}
