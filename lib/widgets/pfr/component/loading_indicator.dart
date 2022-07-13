import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator {
  final BuildContext dialogContext;

  LoadingIndicator(this.dialogContext);

  Future show(String msg) async {
    showDialog(
      context: dialogContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoActivityIndicator(),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(msg),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future hide() async {
    Navigator.of(dialogContext).pop();
  }
}
