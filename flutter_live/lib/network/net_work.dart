import 'dart:convert';
import 'dart:io';

import 'base_entity.dart';
import 'error_handle.dart';
import 'package:bmmobile/network/http_api.dart';
import 'package:bmmobile/network/intercept.dart';
import 'package:bmmobile/storage/global.dart';
import 'package:bmmobile/storage/user_manager.dart';
import 'package:bmmobile/utils/log_util.dart';
import 'package:bmmobile/utils/ui_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'http_api.dart';


import 'package:oktoast/oktoast.dart';

///网络请求类
class NetWork {

  static final NetWork _singleton = NetWork._internal();

  static NetWork get instance => NetWork();

  static Dio? _dio = null;

  factory NetWork() {
    return _singleton;
  }

  bool _isShow = false; //是否已展示弹框

  bool _isShowError = false; //是否已展示错误弹框

  ///网络请求类初始化配置
  NetWork._internal() {
    if (_dio == null) {
      String baseUrl =  HttpApi.baseUrl;
      var options = BaseOptions(
          connectTimeout: 60000,
          receiveTimeout: 60000,
          method: "POST",
          contentType: Headers.formUrlEncodedContentType,
          responseType: ResponseType.plain,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          baseUrl: baseUrl);
      _dio = Dio(options);
      _isShow = false;
      if (!HttpApi.inProduction) {
        _dio.interceptors.add(LoggingInterceptor());
      }
      _dio.interceptors.add(DataHandleInterceptor());
    }
  }

  ///普通网络请求
  ///[url] 请求地址
  ///【params】请求参数
  ///【cancelToken】请求取消唯一标识
  Future<BaseEntity<T>> _request<T>(String url,
      {Map<String, dynamic> params, CancelToken cancelToken}) async {

    var response = await _dio.request(url, data: params, cancelToken: cancelToken);
    try {
      Map<String, dynamic> map = parseData(response.data);
      return BaseEntity<T>.fromJson(map);
    } catch (e) {
      return BaseEntity(
          ExceptionHandle.parse_error.toString(), '数据解析错误', null);
    }
  }

  //用于列表数据请求
  Future requestNetwork<T>(String url,
      {Function(T t) onSuccess,
        Function(String code, String msg) onError,
        CancelToken cancelToken,
        dynamic params}) {
    return _request<T>(url, params: params, cancelToken: cancelToken).then(
            (BaseEntity<T> result) {
          if (result.code == "000000") {
            if (onSuccess != null) {
              onSuccess(result.data);
            }
          } else if (result.code == "BM000503"||result.code=='BM000505') {
            EasyLoading.dismiss();

            if(!Global.isShow){
              Global.isShow = true;
              UIUtil.showBottomSheet(
                  title: "温馨提示",
                  content: "${result.msg}",
                  textConfirm: "重新登录",
                  textCancel: "取消",
                  onConfirm:(){
                    Global.isShow = false;
                    UserManager.getInstance().clear();
                  },
                  onCancel:(){
                    Global.isShow = false;
                  }
              );
            }


          }  else {
            onError(result.code, result.msg);
          }
        }, onError: (e, _) {
      _cancelLogPrint(e, url);
      NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  /**
   * 异步post请求
   * url ： 请求地址
   * onSuccess ：成功回调
   * onSuccessList ：成功回调 list数据
   * onError ：失败请求
   */
  asyncRequestNetwork<T>(String url,
      {Function(T t) onSuccess,
        Function(String code, String msg) onError,
        bool isError:true,
        CancelToken cancelToken,

        dynamic params}) {
    Stream.fromFuture(
        _request<T>(url, params: params, cancelToken: cancelToken))
        .asBroadcastStream()
        .listen((result) {
      if (result.code == "000000") {
        onSuccess(result.data);
      } else if (result.code == "BM000503"||result.code=='BM000505'||result.code=='BM000504') {
        EasyLoading.dismiss();

        if(!Global.isShow){
          Global.isShow = true;
          UIUtil.showBottomSheet(
              title: "温馨提示",
              content: "${result.msg}",
              textConfirm: "重新登录",
              textCancel: "取消",
              onConfirm:(){
                Global.isShow = false;
                UserManager.getInstance().clear();
              },
              onCancel:(){
                Global.isShow = false;
              }
          );
        }



      } else {
        onError(result.code, result.msg);
        if(!_isShowError&&isError){
          // _isShowError = true;
          if(result.code != "1005"){
            if(result.code.length==4){
              _showErrorToast('(${ExceptionHandle.system_code+result.code})${result.msg}');
            }else{
              if(result.code!=1004&&result.code!="999997"){
                _showErrorToast('(${result.code})${result.msg}');
              }

            }
          }
        }
      }
    }, onError: (e) {
      _cancelLogPrint(e, url);
      NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }



  ///上传文件
  Future<BaseEntity<T>> uploadFile<T>(String url,
      {Function(T t) onSuccess,
        Function(String code, String msg) onError,
        @required MultipartFile file,
        CancelToken cancelToken}) async {
    try {

      var response = await _dio.post(url, data: FormData.fromMap({"file":file}));
      Map<String, dynamic> map = parseData(response.data);
      BaseEntity result = BaseEntity<T>.fromJson(map);
      if (result.code == "000000") {
        if (onSuccess != null) {
          onSuccess(result.data);
        }
      } else if (result.code == "BM000503"||result.code=='BM000505') {
        EasyLoading.dismiss();

        if(!Global.isShow){
          Global.isShow = true;
          UIUtil.showBottomSheet(
              title: "温馨提示",
              content: "${result.msg}",
              textConfirm: "重新登录",
              textCancel: "取消",
              onConfirm:(){
                Global.isShow = false;
                UserManager.getInstance().clear();
              },
              onCancel:(){
                Global.isShow = false;
              }
          );
        }

      } else {
        _showErrorToast('(${result.code})${result.msg}');
        onError(result.code, result.msg);
      }
    } catch (e) {
      onError(ExceptionHandle.parse_error.toString(), '数据解析错误');
    }
  }

  ///上传文件
  Future<BaseEntity<T>> mutUploadFile<T>(
      {Function(T t) onSuccess,
        Function(String code, String msg) onError,
        @required List<MultipartFile> files,
        CancelToken cancelToken}) async {
    try {
      
      var response = await _dio.post(HttpApi.multiUpload, data: FormData.fromMap({"files":files}));
      Map<String, dynamic> map = parseData(response.data);
      BaseEntity result = BaseEntity<T>.fromJson(map);
      if (result.code == "000000") {
        if (onSuccess != null) {
          onSuccess(result.data);
        }
      }
      else if (result.code == "BM000503"||result.code=='BM000505') {

        if(!Global.isShow){
          Global.isShow = true;
          UIUtil.showBottomSheet(
              title: "温馨提示",
              content: "${result.msg}",
              textConfirm: "重新登录",
              textCancel: "取消",
              onConfirm:(){
                Global.isShow = false;
                UserManager.getInstance().clear();
              },
              onCancel:(){
                Global.isShow = false;
              }
          );
        }


      }
      else {
        if(result.code!=1004){
          _showErrorToast('(${result.code})${result.msg}');
          onError(result.code, result.msg);
        }

      }
    } catch (e) {
      onError(ExceptionHandle.parse_error.toString(), '数据解析错误');
    }
  }


  _showErrorToast(String title){

    showToast(title);
  }


  _onError(int code, String msg, Function(String code, String mag) onError) {
    if (code == null) {
      code = ExceptionHandle.unknown_error;
      msg = '未知异常';
    }
    Log.e('接口请求异常： code: $code, mag: $msg');
    if (onError != null) {
      onError(code.toString(), msg);
    }
  }

  _cancelLogPrint(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      Log.e('取消请求接口： $url');
    }
  }

  Map<String, dynamic> parseData(String data) {
    return json.decode(data);
  }
}
