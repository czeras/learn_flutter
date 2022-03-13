// 用户管理单例

import '../../models/user_model.dart';
import 'package:flustars/flustars.dart';
import 'global.dart';
import '../tools/navigator_util.dart';

class UserManager {
  UserManager._();

  static UserManager _instance;

  UserModel _userModel;




  static UserManager getInstance() {
    if (_instance == null) {
      _instance = UserManager._();
    }

    return _instance;
  }

  insertModel(UserModel doctorModel) {
    _userModel = doctorModel;
    SpUtil.putObject("user", doctorModel.toJson());
  }

  UserModel get doctorModel {
    if (_userModel == null) {
      Map<String, dynamic> map = SpUtil.getObject("user");
      if (map == null) {
        return null;
      }
      _userModel = UserModel.fromJson(map);
    }

    return _userModel;
  }



  void clear() {

    if(_userModel!=null){
      _userModel = null;
      Global.token = "";
      SpUtil.remove("user");
      NavigatorUtil.goToLogin();
    }

  }




}