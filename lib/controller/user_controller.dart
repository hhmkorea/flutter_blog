import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // 상태관리 : UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트

  void logout(){ // 로그아웃
    isLogin.value = false;
    jwtToken = null;
  }

  Future<String> login(String username, String password) async {
    // await사용할 경우 Future<>와 async가 붙어야함.
    String token = await _userRepository.login(username, password); // 기다렸다가 데이터 받아야함. 처음에 null을 기본으로 받게됨.

    if(token != "-1") { // -1이면 응답을 안받은것.
      isLogin.value = true;          // 상태변경
      jwtToken = token;              // ---> jwt.dart 파일에 Token을 저장함.
      print("jwtToken : $jwtToken"); // ---> Bearer Token 정보 로그 보여줌
    }
    return token;
  }
}