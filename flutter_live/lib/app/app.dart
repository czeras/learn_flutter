import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';


class DefaultApp {
  // 运行app
  static void run() async {

  }


}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      textPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      position: ToastPosition.bottom,
      textStyle: TextStyle(
          color: Colors.white,
          fontSize: 16
      ),
      child: GetMaterialApp(
        builder: (BuildContext context, Widget child) {
          return FlutterEasyLoading(child: MediaQuery(child: child,data:MediaQuery.of(context).copyWith(textScaleFactor: 1.0)));
        },
        getPages: RouterConfig.getPages,
        defaultTransition: Transition.rightToLeft,
        debugShowCheckedModeBanner: false,
        title: '春播云诊所',
        theme: ThemeData(
          appBarTheme: AppBarTheme(brightness:Brightness.light),
          fontFamily: 'PingFangSC',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: AppColors.COLOR_F3F3F3,

        ),
        home: LaunchPage(),
      ),
    );
  }
}