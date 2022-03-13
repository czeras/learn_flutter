import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../extension/num_estension.dart';

///统一占位间距
class AppGaps {
  static const Widget empty = const SizedBox.shrink();
  static final Widget line = Container(
    height: 1.rpx,
    color: AppColors.COLOR_DBDBDB,
  );

  static  Widget v_line({Color color,double height:0}) => Container(
    width: 0.5.rpx,
    height: height,
    color: AppColors.COLOR_DBDBDB,
  );

  static  Widget lineColor({Color color}) =>  Container(
    height: 1.rpx,
    color: color??AppColors.COLOR_DBDBDB,
  );

  /// 水平间隔
  static final Widget hGap1 = SizedBox(width: 1.rpx);
  static final Widget hGap2 = SizedBox(width: 2.rpx);
  static final Widget hGap5 = SizedBox(width: 5.rpx);
  static final Widget hGap8 = SizedBox(width: 8.rpx);
  static final Widget hGap9 = SizedBox(width: 9.rpx);
  static final Widget hGap10 = SizedBox(width: 10.rpx);
  static final Widget hGap12 = SizedBox(width: 12.rpx);
  static final Widget hGap14 = SizedBox(width: 14.rpx);
  static final Widget hGap20 = SizedBox(width: 20.rpx);
  static final Widget hGap40 = SizedBox(width: 40.rpx);

  /// 垂直间隔
  static final Widget vGap1 = SizedBox(height: 1.rpx);
  static final Widget vGap5 = SizedBox(height: 5.rpx);
  static final Widget vGap7 = SizedBox(height: 7.rpx);
  static final Widget vGap10 = SizedBox(height: 10.rpx);
  static final Widget vGap14 = SizedBox(height: 14.rpx);
  static final Widget vGap15 = SizedBox(height: 15.rpx);
  static final Widget vGap20 = SizedBox(height: 20.rpx);
  static final Widget vGap30 = SizedBox(height: 30.rpx);
  static final Widget vGap40 = SizedBox(height: 40.rpx);
  static final Widget vGap50 = SizedBox(height: 50.rpx);
}
