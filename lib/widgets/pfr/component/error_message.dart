import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.msg, this.useWarning = true})
      : super(key: key);
  final String msg;
  final bool useWarning;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 2,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                color: AppColor.error,
                height: 6,
                width: 6,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: AppColor.error,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (this.useWarning)
                  Icon(
                    CupertinoIcons.exclamationmark_triangle,
                    color: Colors.white,
                    size: 14,
                  ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  this.msg,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
