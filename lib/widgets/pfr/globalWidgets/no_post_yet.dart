import 'package:app/constant.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoPostYet extends StatelessWidget {
  const NoPostYet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SvgPicture.asset("assets/svg/NoPostYet.svg"),
          AppSpacing.sq10,
          Text(
            LocaleKeys.noPostYet.tr(),
            style: AppText.r20,
          )
        ],
      ),
    );
  }
}
