import 'package:intl/intl.dart';

class User {
  final int? id;
  final String? username;
  final String? email;
  final DateTime? created;
  final DateTime? updated;

  User({
    this.id,
    this.username,
    this.email,
    this.created,
    this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  User.fromJson(Map<String, dynamic> json)
    : id = json["id"], // 이니셜 라이즈드 연산자
      username = json["username"],
      email = json["email"],
      created = DateFormat("yyymm-mm-dd").parse(json["created"]),
      updated = DateFormat("yyymm-mm-dd").parse(json["updated"]);

}