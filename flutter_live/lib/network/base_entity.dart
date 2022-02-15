

import 'dart:collection';

class BaseEntity<T>{

  String code;

  String msg;

  T data;

  BaseEntity(this.code, this.msg, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    msg = json["msg"];
    if(json["data"]!=null){
      data = _generateOBJ(json["data"]);
    }
  }


  S _generateOBJ<S>(json) {
    if (S.toString() == 'String') {
      return json.toString() as S;
    } else if (T.toString() == 'Map<String, dynamic>') {
      return json as S;
    } else if (T.toString() == 'List<dynamic>') {
      return json as S;
    } else {
      return json;
    }
  }
}
