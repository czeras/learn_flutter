import 'dart:collection';
import 'dart:io';
import 'package:bmmobile/storage/global.dart';
import 'package:bmmobile/utils/log_util.dart';
import 'package:des/des.dart';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../github_space/learn_flutter/flutter_live/lib/network/error_handle.dart';
import 'http_api.dart';

class LoggingInterceptor extends Interceptor {
  DateTime startTime;
  DateTime endTime;



  @override
  onRequest(RequestOptions options,
      RequestInterceptorHandler handler) {
    startTime = DateTime.now();
    Log.d('----------Start----------');
    debugPrint('$startTime----------Start----------');
    if (options.queryParameters.isEmpty) {
      debugPrint('RequestUrl: ' + options.baseUrl + options.path);
    } else {
      debugPrint('RequestUrl: ' +
          options.baseUrl +
          options.path +
          '?' +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    debugPrint('RequestMethod: ' + options.method);
    debugPrint('RequestHeaders:' + options.headers.toString());
    debugPrint('RequestContentType: ${options.contentType}');
    debugPrint('RequestData: ${options.data.toString()}');
    return super.onRequest(options,handler);
  }

  @override
  Future onResponse(Response response,
      ResponseInterceptorHandler handler) async {
    endTime = DateTime.now();
    int duration = endTime.difference(startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      debugPrint('ResponseCode: ${response.statusCode}');
    } else {
      debugPrint('ResponseCode: ${response.statusCode}');
    }
    // 输出结果
    await Des.initKey("yEA#%5o@Oc");
    String params = await Des.decrypt(response.data);
    print("${params} 请求地址：${response.requestOptions.baseUrl}${response.requestOptions.path}");
    Log.d('----------End: $duration 毫秒----------');
    return super.onResponse(response,handler);
  }

  @override
  onError( DioError err,
      ErrorInterceptorHandler handler) {
    Log.d('----------Error-----------');
    return super.onError(err,handler);
  }
}

class DataHandleInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    if (options.path == HttpApi.upload||options.path == HttpApi.multiUpload) {
      //请求头统一新增token
      String token = Global.token;
      if(!token.isEmpty){
        options.headers["Authorization"] = token;
      }

      //请求头新增设备类型deviceType
      options.headers["deviceType"] = Platform.isIOS?4:3;

      return super.onRequest(options,handler);
    }
    String token = Global.token;
    if(!token.isEmpty){
      options.headers["Authorization"] = token;
    }

    //参数为空
    HashMap<dynamic, dynamic> hashMap;

    if (options.data == null) {
      hashMap = new HashMap();
    } else {
      hashMap = HashMap.from(options.data);
    }
    //获取请求参数
    print(options.data);

    String data = JsonUtil.encodeObj(hashMap);
    //统一加密
    await Des.initKey("yEA#%5o@Oc");
    String params = await Des.encrypt(data);
    HashMap newMap = HashMap();
    newMap["data"] = params;
    options.data = HashMap.from(newMap);
    return super.onRequest(options,handler);
  }

  @override
  Future onResponse(Response response,
      ResponseInterceptorHandler handler) async {
    // TODO: implement onResponse
    //统一解密
    await Des.initKey("yEA#%5o@Oc");
    String params = await Des.decrypt(response.data);
    response.data = params;
    return super.onResponse(response,handler);
  }
}
