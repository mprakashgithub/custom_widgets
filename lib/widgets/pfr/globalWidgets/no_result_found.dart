import 'package:app/constant.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: colorScheme.onPrimary,
          child: CircleAvatar(
            backgroundColor: colorScheme.background,
            radius: 25,
            child: Text("😅",style: TextStyle(fontSize: 25),),
          ),
        ),
        AppSpacing.sq16,
        Text(
          LocaleKeys.noResultFound.tr(),
          style: AppText.m20,
        )
      ],
    );
  }
}
