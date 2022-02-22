
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_live/pages/launch_page.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import '../configs/router_config.dart';

class DefaultApp{
//运行app
  static void run() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await FlutterDownloader.initialize(
    //     debug: true
    // );
    // final tasks = await FlutterDownloader.loadTasks();
    // tasks.forEach((task) {
    //   FlutterDownloader.remove(taskId: task.taskId);
    // });
    // UserManager.getInstance().clear();
    initApp();
    runApp(MyApp());
  }

  //程序初始化操作
  static void initApp() {
    SpUtil.getInstance(); //数据本地持久化初始化
    LogUtil.init(); //初始化日志工具
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
        // builder: (BuildContext context, Widget child) {
        //   return FlutterEasyLoading(child: MediaQuery(child: child,data:MediaQuery.of(context).copyWith(textScaleFactor: 1.0)));
        // },
        getPages: RouterConfig.getPages,
        defaultTransition: Transition.rightToLeft,
        debugShowCheckedModeBanner: false,
        title: '春播云诊所',
        theme: ThemeData(
          appBarTheme: AppBarTheme(brightness:Brightness.light),
          fontFamily: 'PingFangSC',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // scaffoldBackgroundColor: AppColors.COLOR_F3F3F3,
          scaffoldBackgroundColor: Colors.green
        ),
        // home: LaunchPage(),
        home: LaunchPage(),
      ),
    );
  }
}