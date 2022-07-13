import 'package:app/constant.dart';
import 'package:app/constants/custom_message.dart';
import 'package:app/constants/globle_data.dart';
import 'package:app/repository/common_repository.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendReport extends StatefulWidget {
  final String itemId, reporterId,reportType;

  const SendReport({Key? key, required this.itemId, required this.reporterId,required this.reportType})
      : super(key: key);

  @override
  _SendReportState createState() => _SendReportState();
}

class _SendReportState extends State<SendReport> {
  String adv = "adv";
  String profanity = "profanity";
  String abusive = "abusive";
  String copyright = "copyright";
  String other = "other";
  String group = "NA";

  @override
  Widget build(BuildContext context) {
    var colorScheme =
        Theme.of(GlobalData.globalKey.currentState!.context).colorScheme;
    var size = MediaQuery.of(GlobalData.globalKey.currentState!.context).size;
    return AlertDialog(
      title: Text(
        LocaleKeys.reportContentTitle.tr(),
        style: AppText.m20,
      ),
      content: Container(
        height: size.height * 0.54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.reportContentSubTitle.tr(),
              style: AppText.r14.copyWith(color: colorScheme.primaryVariant),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: colorScheme.surface,
            ),
            Column(
              children: [
                RadioListTile(
                    dense: true,
                    value: adv,
                    title: Text(LocaleKeys.improperAdvertisement.tr(),
                        style: AppText.r16),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.lightBlueAccent,
                    groupValue: group,
                    onChanged: (val) {
                      setState(() {
                        group = adv;
                      });
                    }),
                RadioListTile(
                    dense: true,
                    value: profanity,
                    title: Text(LocaleKeys.profanity.tr(), style: AppText.r16),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.lightBlueAccent,
                    groupValue: group,
                    onChanged: (val) {
                      setState(() {
                        group = profanity;
                      });
                    }),
                RadioListTile(
                    dense: true,
                    value: abusive,
                    title: Text(LocaleKeys.abusive.tr(), style: AppText.r16),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.lightBlueAccent,
                    groupValue: group,
                    onChanged: (val) {
                      setState(() {
                        group = abusive;
                      });
                    }),
                RadioListTile(
                    dense: true,
                    value: copyright,
                    title:
                        Text(LocaleKeys.copyrightIP.tr(), style: AppText.r16),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.lightBlueAccent,
                    groupValue: group,
                    onChanged: (val) {
                      setState(() {
                        group = copyright;
                      });
                    }),
                RadioListTile(
                    dense: true,
                    value: other,
                    title: Text(
                      LocaleKeys.otherReport.tr(),
                      style: AppText.r16,
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.lightBlueAccent,
                    groupValue: group,
                    onChanged: (val) {
                      setState(() {
                        group = other;
                      });
                    }),
              ],
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: CupertinoButton(
                  disabledColor: colorScheme.secondaryVariant,
                  color: colorScheme.onPrimary,
                  child: Text(
                    LocaleKeys.Report.tr(),
                    style: AppText.m18.copyWith(color: colorScheme.background),
                  ),
                  onPressed: () async {
                    bool res = await CommonRepository().reportItem(
                        widget.itemId, widget.reporterId, widget.reportType, "$group");
                    if (res) {
                      Navigator.of(context).pop();
                      CustomMessage.ScfMessage(
                          LocaleKeys.reportCnfMsg.tr(), colorScheme.onPrimary);
                    } else {
                      CustomMessage.ScfMessage(
                          "Could not send report", colorScheme.error);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
