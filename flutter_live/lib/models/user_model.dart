//用户模型
class UserModel {
  int ucUserId;//全局用户id

  UserModel({
    this.ucUserId,

  });

  UserModel.fromJson(Map<String, dynamic> json) {
    ucUserId = json['ucUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ucUserId'] = this.ucUserId;

    return data;
  }
}
