// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sira_base/utilities/dio_instance.dart';

import '../utilities/logger.dart';

var getIt = GetIt.instance;

class AuthService {
  doLogin(data) async {
    Dio dioInstance = getIt.get<DioInstance>().init();
    // var response = await dioInstance.get("https://kiwi.ci/api/v1/banners");
    // logInfo(response.data.toString());
    await Future.delayed(Duration(seconds: 3));
    logInfo("${toString()} Authenticated successfuly ");
  }
}
