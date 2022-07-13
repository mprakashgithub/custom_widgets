import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String? text;
  final Color? buttonColor;
  final double? borderRadiusValue, buttonHeight, buttonWidth;
  final void Function()? onClick;
  const CustomButton(
      {Key? key,
      required this.text,
      this.buttonColor,
      this.borderRadiusValue,
      this.buttonHeight,
      this.buttonWidth,
      this.onClick})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double? _height, _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Container(
      height: widget.buttonHeight ?? 45,
      width: widget.buttonWidth ?? _width! * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? 10),
        color: widget.buttonColor ?? AppColors.blue,
      ),
      child: MaterialButton(
        onPressed: widget.onClick ?? () {},
        child: Text(widget.text!,
            style: AppTextStyle.font16AsapRegularWhiteTextStyle),
      ),
    );
  }
}
