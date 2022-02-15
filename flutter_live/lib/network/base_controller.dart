

import 'dart:io';
import 'package:bmmobile/constant/app_colors.dart';
import 'package:bmmobile/models/user_model.dart';
import 'package:bmmobile/network/net_work.dart';
import 'package:bmmobile/storage/global.dart';
import 'package:bmmobile/storage/user_manager.dart';
import 'package:bmmobile/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as CBGet;

///逻辑层基类
class BaseController extends CBGet.GetxController{

  CBGet.RxBool isLoading = false.obs;

  CancelToken _cancelToken;

  UserModel userModel = UserManager.getInstance().doctorModel;

  /// 普通请求
  ///  [url] 请求地址
  /// 【params】请求参数
  /// 【onSuccess】请求成功回调
  /// 【onError】请求失败回调
  /// 【showLoading】是否展示加载框
  /// 【hintText】加载提示文字
  /// 【token】请求唯一标识
  void fetch<T>(
      url,
      {
        Map<String,dynamic> params,
        Function(T t) onSuccess,
        Function(String code, String msg) onError,
        bool showLoading = true,
        String hintText = '正在加载...',
        CancelToken token
      }) {
    if(showLoading){
      showProgress(hintText);
    }
    // FocusScope.of(CBGet.Get.context).requestFocus(FocusNode());
    NetWork.instance.asyncRequestNetwork<T>(
        url,
        params: params,
        cancelToken:token??_cancelToken,
        onSuccess: (data) {
          if(showLoading){
            hideProgress();
          }
          if (onSuccess != null) {
            onSuccess(data);
          }
        },
        onError: (code, msg) {
          hideProgress();
          if (onError != null) {
            onError(code, msg);
          }
        });
  }

  ///  请求列表数据
  ///  [url] 请求地址
  /// 【params】请求参数
  /// 【onSuccess】请求成功回调
  /// 【onError】请求失败回调
  /// 【showLoading】是否展示加载框
  /// 【token】请求唯一标识
  Future fetchList<T>(
      url,
      {
        Map<String,dynamic> params,
        Function(T t) onSuccess,
        Function(String code, String msg) onError,
        CancelToken token
      }) {
    if(params["pageNum"]==1){
      isLoading.value = true;
    }
    // FocusScope.of(CBGet.Get.context).requestFocus(FocusNode());
    return NetWork.instance.requestNetwork<T>(
        url,
        params: params,
        cancelToken: _cancelToken,
        onSuccess: (data) {

          if(isLoading.value){

            isLoading.value = false;
          }

          if (onSuccess != null) {
            onSuccess(data);
          }
        }, onError: (code, msg) {
          if(isLoading.value){

            isLoading.value = false;
          }
          Toast.show('(${code})${msg}');


      if (onError != null) {
        onError(code, msg);
      }
    });
  }

  ///  上传文件
  ///  [url] 请求地址
  /// 【params】请求参数
  /// 【file】文件
  /// 【onSuccess】请求成功回调
  /// 【onError】请求失败回调
  /// 【showLoading】是否展示加载框
  /// 【token】请求唯一标识
  uploadFile<T>(
      url,
      {
        MultipartFile file,
        Function(T t) onSuccess,
        Function(String code, String msg) onError,
      }) {
    showProgress("图片上传中");
    // FocusScope.of(CBGet.Get.context).requestFocus(FocusNode());
    NetWork.instance.uploadFile<T>(
        url,
        file: file,
        cancelToken: _cancelToken,
        onSuccess: (data) {
          hideProgress();
          if (onSuccess != null) {
            onSuccess(data);
          }
        },
        onError: (code, msg) {
          hideProgress();
          if (onError != null) {
            onError(code, msg);
          }
        });
  }

  ///  多文件上传
  /// 【params】请求参数
  /// 【file】文件
  /// 【onSuccess】请求成功回调
  /// 【onError】请求失败回调
  /// 【showLoading】是否展示加载框
  /// 【token】请求唯一标识
  mutUploadFile<T>(
      {
        List<MultipartFile> files,
        Function(T t) onSuccess,
        Function(String code, String msg) onError,
      }) {
    showProgress("图片上传中");
    NetWork.instance.mutUploadFile<T>(
        files: files,
        cancelToken: _cancelToken,
        onSuccess: (data) {
          hideProgress();
          if (onSuccess != null) {
            onSuccess(data);
          }
        },
        onError: (code, msg) {
          hideProgress();
          if (onError != null) {
            onError(code, msg);
          }
        });
  }



  //显示加载框
  void showProgress(String hintText) {
    try {
      EasyLoading.show(status: hintText,indicator: CircularProgressIndicator(
        backgroundColor: AppColors.COLOR_1F7BF3,
      ));
    } catch (e) {
      /// 异常原因主要是页面没有build完成就调用Progress。
      print(e);
    }
  }

  void hideProgress() {
    print("隐藏加载框");
    EasyLoading.dismiss();
  }




}