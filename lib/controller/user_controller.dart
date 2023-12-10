import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // 상태관리 : UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final principal = User().obs;

  void logout(){ // 로그아웃
    this.isLogin.value = false;
    jwtToken = null;
  }

  Future<int> login(String username, String password) async {
    // await사용할 경우 Future<>와 async가 붙어야함.
    User principal = await _userRepository.login(username, password); // 기다렸다가 데이터 받아야함. 처음에 null을 기본으로 받게됨.

    if(principal.id != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }
}