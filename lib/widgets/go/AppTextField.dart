import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  FontWeight fontWeight;
  InputDecoration decoration;
  EdgeInsets margin;
  int maxLines;
  double fontSize;
  TextEditingController controller;
  Function onChanged;
  TextInputAction textInputAction;
  Function onFieldSubmitted;

  AppTextField(
      {Key key,
      this.fontWeight,
      this.decoration,
      this.margin,
      this.controller,
      this.maxLines,
      this.fontSize,
      this.onChanged,
      this.textInputAction,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppTextFieldState();
  }
}

class AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.margin,
        child: TextField(
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          controller: widget.controller,
          maxLines: widget.maxLines,

          style: TextStyle(
            fontSize: widget.fontSize,
            fontFamily: "MyriadPro",
            fontWeight: widget.fontWeight,
          ),
          decoration: widget.decoration,
        ));
  }
}
