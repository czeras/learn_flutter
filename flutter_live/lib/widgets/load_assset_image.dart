
import 'package:flutter/cupertino.dart';

class LoadAssetImage extends StatelessWidget {

  final String image;
  final double width;
  final double height;
  final double touchwidth;
  final double touchheight;
  final int cacheWidth;
  final int cacheHeight;
  final BoxFit fit;
  final String format;
  final Color color;
  final VoidCallback onTap;
  final Decoration decoration;
  final AlignmentGeometry alignment;
  final MainAxisAlignment mainAxisAlignment;

  const LoadAssetImage(this.image, {
    Key key,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit,
    this.format: 'png',
    this.color,
    this.onTap,
    this.touchwidth,
    this.touchheight,
    this.decoration, this.alignment, this.mainAxisAlignment:MainAxisAlignment.center
  }): super(key: key);


  @override
  Widget build(BuildContext context) {

    Widget widget ;
    if(onTap!=null){
      widget = GestureDetector(
        onTap: (){
          if(onTap!=null){
            onTap();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: touchwidth,
          height: touchheight,
          alignment: alignment??Alignment.center,
          decoration: decoration,
          child:Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [ Image.asset(
                CBImageUtil.getImgPath(image, format: format),
                height: height,
                width: width,
                cacheWidth: cacheWidth,
                cacheHeight: cacheHeight,
                fit: fit,
                color: color,
                /// 忽略图片语义
                excludeFromSemantics: true,
                gaplessPlayback:true
            )],
          ),
        ),
      );
    }else{
      widget = Image.asset(
        CBImageUtil.getImgPath(image, format: format),
        height: height,
        width: width,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        fit: fit,
        color: color,
        /// 忽略图片语义
        excludeFromSemantics: true,
      );

    }
    return widget;
  }
}

class CBImageUtil{

  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

}