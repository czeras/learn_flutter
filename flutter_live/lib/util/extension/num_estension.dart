import '../tools/screen_fit.dart';


///num的扩展类，用于简写屏幕适配
extension CBScreenExtension on num{
  num get w => CBScreenFit().setWidth(this);

  num get h => CBScreenFit().setHeight(this);

  num get sp => CBScreenFit().setSp(this);

  num get rpx => CBScreenFit().setWidth(this);

}