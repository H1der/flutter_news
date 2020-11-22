
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/utils.dart';

/// 用户
class UserApi{
  /// 登录
  static Future<UserResponseEntity> login({UserRequestEntity params}) async{
    var response = await HttpUtil().post('/user/login',params: params);
    return UserResponseEntity.fromJson(response);

  }
}
