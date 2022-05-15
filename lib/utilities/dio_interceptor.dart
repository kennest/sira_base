import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get_it/get_it.dart';
import 'package:sira_base/utilities/constants.dart' as Constants;
import 'package:sira_base/utilities/dio_instance.dart';
import 'package:sira_base/utilities/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

var dioInstance = getIt.get<DioInstance>();

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logInfo('DIO REQUEST [${options.method}] => PATH: ${options.path}');
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    if (token != null) {
      options.headers["Authorization"] = "$token";
    }
    // options.headers["x-device"] = "Android";
    // options.headers["X-TOKEN"] = Constants.XTOKEN;
    options.headers["X-Plateform"] = "mobile";
    if (options.headers["Content-Type"] == null) {
      options.headers["Content-Type"] = "application/json";
    }
    logInfo(options.headers.toString());
    logInfo(options.data.toString());
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logInfo("RESPONSE TYPE ${response.data.runtimeType.toString()}");
    if (response.data.runtimeType != List &&
        response.data.runtimeType != String) {
      Map<String, dynamic> jsonResponse = response.data;
      if (response.statusCode == 401) {
        if (jsonResponse.containsKey("status")) {
          if (jsonResponse["status"] == 401) {
            logWarning("DIO TOKEN EXPIRED [REFRESHING...]");
            // await Provider.of<AuthProvider>(getx.Get.context!, listen: false)
            //     .updateToken()
            //     .then((value) async {
            //   await _retry(response.requestOptions);
            // });
          }
        }
      } else if (response.statusCode == 402) {
        if (jsonResponse.containsKey("message")) {
          getx.Get.snackbar("Attention !!", "${jsonResponse["message"]}",
              colorText: Colors.white,
              backgroundColor: Colors.yellow,
              icon: Icon(Icons.warning));
          logWarning(jsonResponse["message"]);
        }
        getx.Get.toNamed("/subscription");
      } else if (response.statusCode == 403 &&
          (getx.Get.currentRoute == "/player" ||
              getx.Get.currentRoute == "/live")) {
        if (jsonResponse.containsKey("message")) {
          getx.Get.snackbar("Attention !!", "${jsonResponse["message"]}",
              colorText: Colors.white,
              backgroundColor: Colors.yellow,
              icon: Icon(Icons.warning));
          logWarning(jsonResponse["message"]);
        }
        getx.Get.offAndToNamed("/auth/login");
      }
    }

    logWarning("DIO STATUS CODE  [${response.statusCode}]");
    logWarning("DIO RESPONSE  [${response.data}]");
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logError("DIO INTERCEPTOR ERROR [${err.message}]");
    logError("DIO ERROR CODE [${err.response?.statusCode}]");
    if (err.message.contains("SocketException")) {
      logError("Socket Exception throw");
      // Provider.of<AppProvider>(getx.Get.context!, listen: false)
      //     .setIsNotReachable();
    }

    logInfo("DIO ERROR CURRENT ROUTE [${getx.Get.currentRoute}]");

    logInfo(
        'DIO REQUEST [${err.requestOptions.method}] => PATH: ${err.requestOptions.path}');
    if (err.response != null) {
      debugPrint("DIO INTERCEPTOR ERROR CODE [${err.response!.statusCode}]");
      if (err.response!.statusCode == 401) {
        Map<String, dynamic> jsonResponse = err.response!.data;
        logWarning("DIO TOKEN EXPIRED [REFRESHING...]");
        if (jsonResponse.containsKey("status")) {
          if (jsonResponse["status"] == 401) {
            // await Provider.of<AuthProvider>(getx.Get.context!, listen: false)
            //     .updateToken()
            //     .then((value) async {
            //   return _retry(err.requestOptions);
            // });
          }
        }
      } else if (err.response!.statusCode == 402) {
        await getx.Get.toNamed("/subscription");
      } else if (err.response!.statusCode == 403 &&
          (getx.Get.currentRoute == "/player" ||
              getx.Get.currentRoute == "/live")) {
        if (err.response!.data.runtimeType == Map) {
          Map<String, dynamic> jsonResponse = err.response!.data;
          if (jsonResponse.containsKey("message")) {
            getx.Get.snackbar("Attention !!", "${jsonResponse["message"]}",
                colorText: Colors.white,
                backgroundColor: Colors.yellow,
                icon: Icon(Icons.warning));
            logWarning(jsonResponse["message"]);
          }
        }
        getx.Get.offAndToNamed("/auth/login");
      }
    }
    // debugPrint("DIO INTERCEPTOR ERROR DATA [${err.response!.data}]");
    logError(err.stackTrace.toString());

    return handler.next(err);
  }

  /// - [DioInterceptor Retry]
  ///   will relaunch the previous failed request due to 401 error
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    debugPrint("DIO TOKEN UPDATED [RE-LAUNCHING...]");
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var headers = requestOptions.headers;
    headers["Authorization"] = token;
    final options = new Options(
      method: requestOptions.method,
      headers: headers,
    );

    logWarning(
        "[RE-LAUNCHING HEADERS] : [${requestOptions.headers.toString()}]");
    return dioInstance.init().request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
