
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

///启动页
class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {

  String version = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 延时 3s 启动页完成之后 进入到首页
    Future.delayed(Duration(seconds: 3),(){
      // if(CBStringUtil.isEmpty(Global.token)||UserManager.getInstance().doctorModel==null){
      //   NavigatorUtil.goToLogin();
      // }else{
      //   if(UserManager.getInstance().doctorModel.positionNameList==null){
      //     NavigatorUtil.goToPerfect();
      //   }else{
      //     NavigatorUtil.goToHome();
      //   }
      //
      // }
    });
    getVersion();
  }

  void getVersion()async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
    );

    // CBScreenFit.init(context);
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       LoadAssetImage("lanuch",width: Get.width,fit: BoxFit.cover,),
    //       Positioned(
    //           bottom: 60.rpx,
    //           child: Container(
    //             width: Get.width,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 LoadAssetImage("lanuch_logo",width: 50.rpx,height: 50.rpx),
    //                 AppGaps.hGap20,
    //                 CBView(
    //                   text:"春播助手",
    //                   style: CBTextStyles.textBlack3_font22(isBold: true),
    //                 )
    //               ],
    //             ),
    //           )
    //       ),
    //       Positioned(
    //           bottom: 20.rpx,
    //           child: CBView(
    //             width: Get.width,
    //             textAlignment: Alignment.center,
    //             text: "版本：v${version}",
    //             style: CBTextStyles.textBlack9_font16(),
    //           )
    //       )
    //     ],
    //   ),
    // );
  }
}
