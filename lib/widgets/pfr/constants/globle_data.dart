import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalData {
  GlobalData._();

  static final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  static final GlobalObjectKey<ScaffoldState> globalScaffoldKey = GlobalObjectKey(ScaffoldState);
  static final ColorScheme colorScheme = Theme.of(globalKey.currentState!.context).colorScheme;

  static String getCommentTime(DateTime date) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(date);
    if (difference.inDays > 365) {
      return "${(difference.inDays / 365).round()} year";
    }else if(difference.inDays>30 &&difference.inDays<=365){
      return "${(difference.inDays/30).round()} month";
    }else if(difference.inDays>7 && difference.inDays<=30){
      return "${(difference.inDays/7).round()} week";
    }else if(difference.inDays>1 && difference.inDays<=7){
      return "${difference.inDays} day";
    }else if(difference.inHours<=24 && difference.inMinutes>60){
      return "${difference.inHours} h";
    }else{
      return "${difference.inMinutes} min";
    }
  }
}
