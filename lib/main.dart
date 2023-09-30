import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // 라우트 설계는 차후 GetX 라이브러리로 사용
      home: HomePage(),
    );
  }
}
