import 'package:app/constants/globle_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant.dart';

enum ScreenType { none, feed, explore, lounge }

PreferredSizeWidget commonAppBar(bool isCharacter, ScreenType type) {
  ColorScheme colorScheme = Theme.of(GlobalData.globalKey.currentState!.context).colorScheme;
  return AppBar(
    automaticallyImplyLeading: false,
    title: isCharacter
        ? Text(
            "🎼 Character Name",
            style: AppText.m18,
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Make Character",
              style: AppText.r14.copyWith(color: colorScheme.onSecondary),
            ),
          ),
    actions: [
      if (ScreenType.explore == type)
        Image.asset(
          "assets/icon/search.png",
          height: 24,
          width: 24,
        ),
      if (ScreenType.feed == type)
        SvgPicture.asset(
          'assets/svg/chat.svg',
          height: 24,
          width: 24,
        ),
      if (ScreenType.feed == type) AppSpacing.sq16,
      if (ScreenType.feed == type)
        Image.asset(
          'assets/icon/notification.png',
          height: 24,
          width: 24,
        ),
      AppSpacing.sq16,
      isCharacter
          ? GestureDetector(
              onTap: () {
                openChangeCharacterDialog(GlobalData.globalKey.currentState!.context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage("assets/golf.png"),
                ),
              ),
            )
          : Container(),
    ],
  );
}

openChangeCharacterDialog(BuildContext context) {
  var size = MediaQuery.of(context).size;
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            color: AppColor.bg,
            height: MediaQuery.of(context).size.height * 0.44,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// DIALOG HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppSpacing.sq4,
                    InkWell(
                      child: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),

                AppSpacing.sq10,
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Change character",
                    style: AppText.m20,
                  ),
                ),
                Divider(
                  height: 20,
                ),

                /// CHARACTERS LIST
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.etcBgDivider), borderRadius: BorderRadius.circular(4), color: Colors.white),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/dog.png"),
                            ),
                            AppSpacing.sq8,
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "User",
                                  style: AppText.m16,
                                ),
                                Text(
                                  "Category (20 days)",
                                  style: AppText.r14,
                                )
                              ],
                            ))
                          ],
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        );
      });
}
