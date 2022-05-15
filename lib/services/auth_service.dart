// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sira_base/utilities/dio_instance.dart';
import 'package:sira_base/utilities/logger.dart';

final getIt = GetIt.instance;

class AuthService {
  doLogin() async {
    var dioInstance = getIt.get<DioInstance>().init();
    await Future.delayed(Duration(seconds: 3));
    logInfo("Authenticated successfuly");
  }
}
