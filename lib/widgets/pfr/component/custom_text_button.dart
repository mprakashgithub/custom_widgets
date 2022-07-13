import 'package:app/constant.dart';
import 'package:flutter/material.dart';

enum ButtonState {
  normal,
  hover,
  disable,
  loading,
}

class CustomTextButton extends StatelessWidget {
  final void Function()? onTap;
  final ButtonState state;
  final String? text;
  const CustomTextButton(
      {Key? key, this.onTap, this.state = ButtonState.disable, this.text})
      : super(key: key);

  get textColor {
    switch (state) {
      case ButtonState.disable:
        return const Color(0xffaaaaaa);
      case ButtonState.hover:
        return const Color(0xffdddddd);
      case ButtonState.normal:
        return const Color(0xffffffff);
      case ButtonState.loading:
        return const Color(0xffffffff);
    }
  }

  get bgColor {
    switch (state) {
      case ButtonState.disable:
        return const Color(0xffdddddd);
      case ButtonState.hover:
        return const Color(0xff555555);
      case ButtonState.normal:
        return AppColor.textMain;
      case ButtonState.loading:
        return AppColor.textMain;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (state == ButtonState.disable) {
          return;
        }
        if (state == ButtonState.loading) {
          return;
        }
        onTap?.call();
      },
      child: Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: (state == ButtonState.disable)
              ? Border.all(color: AppColor.etcTextFieldLine)
              : null,
          color: bgColor,
        ),
        child: Center(
          child: (state == ButtonState.loading)
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  '$text',
                  style: AppText.m18.copyWith(color: textColor),
                ),
        ),
      ),
    );
  }
}
