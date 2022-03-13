
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//路由管理类，统一为常规写法，便于使用
class NavigatorUtil{

  static List _logicList = [];

  /**
   * 跳转到下一页面
   * 必填项：scence页面主体
   * 可选项：transition 跳转动画 默认从右到左
   *        arguments 传参 通过Get.arguments获取参数
   *        result 反向传值
   *         preventDuplicates 是否防止重复页面跳转
   */
  static void push(Widget scence,{Transition transition:Transition.rightToLeft,dynamic arguments,ValueChanged result,bool preventDuplicates = true}){

    Get.to(()=>scence,transition: transition,arguments: arguments,preventDuplicates: preventDuplicates).then((value){
      if(result!=null){
        result(value);
      }
    });

  }

  /**
   * 跳转到下一页面
   * 必填项：page 已注册的页面名称
   * 可选项：transition 跳转动画 默认从右到左
   *        arguments 传参 通过Get.arguments获取参数
   *        result 反向传值
   */
  static void toNamed(String page,{dynamic arguments,ValueChanged result,bool preventDuplicates = true}){

    Get.toNamed(page,arguments: arguments,preventDuplicates: preventDuplicates).then((value){
      if(result!=null){
        result(value);
      }
    });





  }

  /**
   * 跳转到下一页面，并关闭当前页面
   * 必填项：scence页面主体
   * 可选项：transition 跳转动画 默认从右到左
   *        arguments 传参 通过Get.arguments获取参数
   *        result 反向传值
   */
  static void replace(Widget scence,{Transition transition:Transition.rightToLeft,dynamic arguments,ValueChanged result}){
    Get.off(scence,transition: transition,arguments: arguments).then((value){
      if(result!=null){
        result(value);
      }
    });
  }


  /**
   * 返回到上一个页面
   * result:回调参数,配合push/replace result使用
   * closeOverlays：是否同时关闭浮层弹窗 默认为：false
   */
  static void pop<T>({T result, bool closeOverlays = false}){

    Get.back(result: result,closeOverlays: closeOverlays);
  }



  /**
   * 重置路由，跳转到登录页面
   */
  static void goToLogin(){

    // Get.offAll(()=>LoginPage(),transition: Transition.fade);
  }

  /**
   * 重置路由，跳转到首页页面
   */
  static void goToHome(){
    // Get.offAll(()=>RootPage(),transition: Transition.fade);
  }

  /**
   * 重置路由，跳转到完善资料
   */
  static void goToPerfect(){
    // Get.offAll(()=>PerfectDataPage(),transition: Transition.fade);
  }

}