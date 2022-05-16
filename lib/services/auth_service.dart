// ignore_for_file: prefer_const_constructors
import 'package:sira_base/services/absctract_service.dart';
import 'package:sira_base/utilities/dio_instance.dart';

import '../utilities/logger.dart';

class AuthService extends AbsctractService {
  doLogin(data) async {
    var dioInstance = getIt!.get<DioInstance>().init();
    // var response = await dioInstance.get("https://kiwi.ci/api/v1/banners");
    // logInfo(response.data.toString());
    await Future.delayed(Duration(seconds: 3));
    logInfo("${toString()} Authenticated successfuly ");
  }
}
