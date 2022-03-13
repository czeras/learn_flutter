// 全局token保存

import 'package:flustars/flustars.dart';
import '../tools/string_util.dart';
import 'package:get/get.dart';

class Global{

  ///登录token 只有登录时才会存在
  static String _token;
  static String get token{
    if(_token==null){
      String value = SpUtil.getString("token");
      if(CBStringUtil.isEmpty(value)){
        return "";
      }
      return value;
    }


    return _token;
  }
  static set token(String value) {
    _token = value;
    SpUtil.putString("token", value);
  }

  ///是否弹出重新登录弹出
  static bool isShow = false;

  ///当前是否有最新版本
  static RxBool isNew = false.obs;
  ///最新版本号
  static String newVersion = "";


}