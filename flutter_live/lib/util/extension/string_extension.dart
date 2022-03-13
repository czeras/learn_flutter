import 'dart:convert';

import 'package:flutter/material.dart';

extension StringExtension on String {
  Color toHexColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }



  /* 使用
  import 'package:bmmobile/extension/string_extension.dart';
  String testStr = ''.percentSignStr(0.45);
  print("percentSign： "+ testStr);
  */
  // 返回带%号的字符串
  String percentSignStr(num inputNum){
    String tempPercentSingStr;
    if(inputNum <= 0){
      tempPercentSingStr = "0%";
    } else {
      tempPercentSingStr = (inputNum*100).toStringAsFixed(2).toString() + "%";
    }
    return tempPercentSingStr;
  }


}