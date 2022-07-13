import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttergohylogistics/helper/AppColors.dart';
import 'package:fluttergohylogistics/helper/AppConstants.dart';
import 'package:fluttergohylogistics/localization/AppLocalization.dart';

class AppAlertDialog extends StatefulWidget {
  String actionText;
  String actionTextWork;
  String textHeading;
  String textMsg;
  Color textColor = AppColors.colorText;
  Color textMsgColor = AppColors.colorText;
  Color textHeadingColor = AppColors.colorPrimary;
  Color borderColor = AppColors.colorPrimaryDark;
  double fontSize;
  double headingFontSize;
  FontWeight fontWeight;
  FontWeight headingFontWeight;
  TextAlign textAlign;
  EdgeInsets margin;
  EdgeInsets marginOutside;
  EdgeInsets padding;
  Color backColor = AppColors.white;
  int maxLines;
  int magMaxLines;

  AppAlertDialog(
      {Key key,
        this.actionTextWork,
      this.textMsg,
      this.textHeading,
      this.marginOutside,
      this.headingFontWeight,
      this.headingFontSize,
      this.textHeadingColor,
      this.textColor,
      this.actionText,
      this.fontWeight,
      this.fontSize,
      this.textAlign,
      this.margin,
      this.padding,
      this.backColor,
      this.borderColor,this.textMsgColor,
      this.maxLines,
      this.magMaxLines})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppAlertDialogState();
  }
}

class AppAlertDialogState extends State<AppAlertDialog> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 300.0,
        height: widget.magMaxLines>2?250.0:200.0,
        margin: widget.marginOutside,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backColor,
          border: Border.all(color: widget.borderColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          children: [
            Container(
                margin: widget.margin,
                child: Text(
                  (AppLocalization.of(context).translate(widget.textHeading) !=
                          null
                      ? AppLocalization.of(context)
                          .translate(widget.textHeading)
                      : widget.textHeading),
                  textAlign: widget.textAlign,
                  maxLines: widget.maxLines,
                  style: TextStyle(
                      color: widget.textHeadingColor,
                      fontFamily: "MyriadPro",
                      fontWeight: widget.headingFontWeight,
                      fontSize: widget.headingFontSize),
                )),
            Text(
              (AppLocalization.of(context).translate(widget.textMsg) != null
                  ? AppLocalization.of(context).translate(widget.textMsg)
                  : widget.textMsg),
              textAlign: widget.textAlign,
              maxLines: widget.magMaxLines,
              style: TextStyle(
                  color: widget.textMsgColor,
                  fontFamily: "MyriadPro",
                  fontWeight: widget.fontWeight,
                  fontSize: widget.fontSize),
            ),
            Container(
              width: 100.0,
              margin: EdgeInsets.only(top:15.0),
              padding: EdgeInsets.all(8.0),
              child: FlatButton(
                color: AppColors.buttonColor,
                onPressed: () {
                  if(widget.actionTextWork=="pop") {
                    Navigator.of(context).pop();
                  }else if(widget.actionTextWork==AppConstants.logout) {
                    Navigator.of(context).pop();
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');

                  }
                  else{
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppConstants.stockItemScreen,
                        arguments: AppConstants.searchArticleCode);
                  }
                },
                child: Text(
                  (AppLocalization.of(context).translate(widget.actionText) !=
                          null
                      ? AppLocalization.of(context).translate(widget.actionText)
                      : widget.actionText),
                  textAlign: widget.textAlign,
                  maxLines: widget.maxLines,
                  style: TextStyle(
                      color: widget.textColor,
                      fontFamily: "MyriadPro",
                      fontWeight: widget.headingFontWeight,
                      fontSize: widget.fontSize),
                ),
              ),
            ),
          ],
        ));
  }
}
