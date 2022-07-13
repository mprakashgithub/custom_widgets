import 'package:app/constants/globle_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMessage {
  static ColorScheme colorScheme = Theme.of(GlobalData.globalKey.currentState!.context).colorScheme;
  static Size size = MediaQuery.of(GlobalData.globalKey.currentState!.context).size;
  static BuildContext context = GlobalData.globalKey.currentState!.context;

  static ScfMessage(String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            '$text',
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          elevation: 2.0,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            label: "close",
          )),
    );
  }

  static Future<void> customDialog(String title, String content, VoidCallback onTap) async {
    return await showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        insetAnimationCurve: Curves.elasticInOut,
        // actionScrollController:
        //     ScrollController(keepScrollOffset: true, initialScrollOffset: 0.5),
        title: Text(title),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: onTap,
            child: Text("Ok"),
          ),
        ],
        content: Text(content),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            color: Theme.of(context).colorScheme.onPrimary,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
