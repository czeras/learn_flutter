import 'dart:io';

import 'package:dio/dio.dart';

class ExceptionHandle {
  static const String system_code = "CZA";//系统统一码
  static const int success = 200;//请求成功


  ///服务器交互异常
  static const int net_error = 1000;//本地网络异常
  static const int socket_error = 1002;//长连接异常
  static const int http_error = 1003;//调用服务器异常
  static const int timeout_error = 1004;//请求超时
  static const int cancel_error = 1005;//请求取消

  ///数据交互异常
  static const int parse_error = 2000;//服务端数据解析异常
  static const int unknown_error = 9999;//未知异常

  static NetError handleException(dynamic error) {
    print(error);
    if (error is DioError) {
      if (error.type == DioErrorType.other ||
          error.type == DioErrorType.response) {
        dynamic e = error.error;
        if (e is SocketException) {
          return NetError(socket_error, '服务器连接超时，请稍后重试！');
        }
        if (e is HttpException) {
          return NetError(http_error, '服务器连接超时，请稍后重试！');
        }
        return NetError(net_error, '网络异常，请检查您的网络连接！');
      } else if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        return NetError(timeout_error, '服务器连接超时，请稍后重试！');
      } else if (error.type == DioErrorType.cancel) {
        return NetError(cancel_error, '取消请求');
      } else {
        return NetError(unknown_error, '操作繁忙，请稍后重试！');
      }
    } else {
      return NetError(unknown_error, '操作繁忙，请稍后重试！');
    }
  }
}

class NetError{
  int code;
  String msg;

  NetError(this.code, this.msg);
}