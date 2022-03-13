import 'dart:ui';
import 'package:flutter/cupertino.dart';

class CBScreenFit{
  static CBScreenFit _instance;
  //默认UI效果图宽高
  static const double defaultWidth = 375;
  static const double defaultHeight = 812;

  //实际UI效果图宽高
  double uiWidth;
  double uiHeight;

  //实际屏幕
  static double _screenWidth;
  static double _screenHeight;

  //设备像素密度
  static double _pixelRatio;

  //状态栏高度
  static double _statusHeight;

  //tabbar高度
  static double _bottomBarHeight;

  //系统字体缩放比例
  static double _textScaleFactor;

  static MediaQueryData _mediaQueryData;


  CBScreenFit._();

  factory CBScreenFit(){
    return _instance;
  }

  /*
   * 在应用入口初始化
   */
  static void init(BuildContext context,{double width = defaultWidth,double height = defaultHeight}){
    //单例
    if(_instance==null){
      _instance = CBScreenFit._();
    }

    //获取实际UI效果宽高
    _instance.uiHeight = height;
    _instance.uiWidth = width;

    //获取当前设备屏幕信息
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _textScaleFactor = mediaQuery.textScaleFactor;
    _statusHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _pixelRatio = mediaQuery.devicePixelRatio;
  }

  ///当前设备密度
  static double get pixelRatio => _pixelRatio;

  /// 当前设备宽度
  static double get screenWidthPT => _screenWidth;

  /// 当前设备高度
  static double get screenHeightPT => _screenHeight;

  /// 当前设备宽度
  static double get screenWidthPX => _screenWidth*_pixelRatio;

  /// 当前设备高度
  static double get screenHeightPX => _screenHeight*_pixelRatio;

  /// 状态栏高度 pt 刘海屏会更高
  static double get statusBarHeight => _statusHeight;

  /// 底部安全区距离 pt
  static double get bottomBarHeight => _bottomBarHeight;

  /// 宽度缩放比例
  double get scaleWidth => _screenWidth / uiWidth;

  /// 高度缩放比例
  double get scaleHeight => _screenHeight / uiHeight;

  /// 文字缩放
  double get scaleText => scaleWidth;

  ///适配后的屏幕宽度
  num setWidth(num width){
    if(_pixelRatio>=2){
      return width * scaleWidth;
    }else{
      return width * scaleWidth/1.5;
    }
  }

  ///适配后的屏幕高度
  num setHeight(num height) => height * scaleHeight;

  //文字适配后大小
  num setSp(num sp) => sp * scaleText;
}