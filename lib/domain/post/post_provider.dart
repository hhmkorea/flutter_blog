import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://192.168.101.69:8080";

// 통신
class PostProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> findAll() =>
      get("$host/post", headers: {"authorization" : jwtToken ?? ""} ); // header에 jwtToken 붙여서 처리해야함, null이면 공백 던짐.

  Future<Response> findById(int id) =>
      get( "$host/post/$id", headers: {"authorization" : jwtToken ?? ""} );
}
