class HttpApi {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction =
  const bool.fromEnvironment('dart.vm.product');

  //请求服务器地址

  static const String baseUrl = "http://192.168.0.125:7003/";//测试环境


//  图片资源地址
//   static const String ftpUrl = "http://192.168.0.127:7778/";
  static const String ftpUrl = "";


  //用户登录
  static const String login = "login/token";

}
