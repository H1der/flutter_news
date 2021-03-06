import 'package:flutter/cupertino.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/utils.dart';

/// 用户
class UserApi {
  /// 登录
  static Future<UserLoginResponseEntity> login(
      {@required BuildContext context, UserLoginRequestEntity params}) async {
    var response =
        await HttpUtil().post('/user/login', context: context, params: params);
    return UserLoginResponseEntity.fromJson(response);
  }
}
