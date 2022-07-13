import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  EdgeInsets margin;
  String hint;
  TextEditingController controller;
  String initialValue;
  bool obscureText;
  IconButton suffixIconWidget;
  String validationText;
  int lines;
  TextStyle hintStyle;
  TextStyle textStyle;
  TextInputAction textInputAction;
  Function onSubmit;
  TextInputType inputType;

  AppTextField(
      {Key key,
      this.margin,
      this.hint,
      this.controller,
      this.initialValue,
      this.obscureText,
      this.suffixIconWidget,
      this.validationText,
      this.lines,
      this.hintStyle,
      this.textStyle,
      this.textInputAction,
      this.onSubmit,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      child: TextFormField(
        keyboardType: inputType != null ? inputType : TextInputType.text,
        inputFormatters: inputType == TextInputType.number
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : null,
        validator: (value) {
          if (value.isEmpty) {
            return validationText;
          } else
            return null;
        },
        textCapitalization: TextCapitalization.sentences,
        minLines: lines != null ? lines : 1,
        maxLines: lines != null ? lines : 1,
        onFieldSubmitted: onSubmit != null ? onSubmit : null,
        controller: controller,
        initialValue: initialValue,
        style: textStyle != null
            ? textStyle
            : TextStyle(fontSize: 14, color: AppColors.black),
        obscureText: (obscureText != null && obscureText) ? true : false,
        decoration: InputDecoration(
            suffixIcon: suffixIconWidget,
            hintText: hint,
            hintStyle: hintStyle != null
                ? hintStyle
                : TextStyle(fontSize: 14, color: AppColors.greyDark),
            fillColor: AppColors.greyLight,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyLight),
                borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyLight),
                borderRadius: BorderRadius.circular(12)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyLight),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyLight),
                borderRadius: BorderRadius.circular(12))),
        textInputAction:
            textInputAction != null ? textInputAction : TextInputAction.done,
      ),
    );
  }
}
