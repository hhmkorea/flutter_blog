import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://192.168.100.69:8080";

// 통신
class PostProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> findAll() => get(
      "$host/post",
      headers: {"authorization" : jwtToken ?? ""}
  );
}
