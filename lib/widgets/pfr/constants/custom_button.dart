import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final title;
  VoidCallback onTap;

  CustomButton(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CupertinoButton(
          color: Theme.of(context).colorScheme.primary,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.white),
          ),
          onPressed: onTap),
    );
  }
}
