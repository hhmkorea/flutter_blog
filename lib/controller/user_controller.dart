import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();

  Future<String> login(String username, String password) async {
    String token = await _userRepository.login(username, password);

    if(token != "-1") {
      jwtToken = token;
      print("jwtToken : $jwtToken");
    }
    return token;
  }
}