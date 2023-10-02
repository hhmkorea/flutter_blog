import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공! => json => Dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password); // loginReqDto : dart request object
    print(loginReqDto.toJson());
    Response response = await _userProvider.login(loginReqDto.toJson()); // data를 Map 타입으로 await로 기다림.
    dynamic headers = response.headers;

    if(headers["authorization"] == null) {
      return "-1";
    } else {
       String token = headers["authorization"];
      return token;
    }
  }
}