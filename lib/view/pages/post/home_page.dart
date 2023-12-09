import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/size.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:flutter_blog/view/pages/post/detail_page.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:flutter_blog/view/pages/user/user_info.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    // find : 있는거 찾기!!
    // put : 없으면 만들고, 있으면 찾기!!,
    /* 객체생성(create), onInit()함수 실행(initialize)
      [GETX] Instance "PostController" has been created
      [GETX] Instance "PostController" has been initialized    */

    PostController p = Get.put(PostController());
    p.findAll();

    return Scaffold(
      drawer: _navigation(context),  // 왼쪽 메뉴 draw로 넣음
      appBar: AppBar(
        title: Text("${u.isLogin}"), // --->> 상태관리, appbar에 로그인 잘되면 true로 보여줌.
        /*
        1. user_controller.dart : final RxBool isLogin = false.obs;
        2. title: Obx(() => Text("${u.isLogin}")), ---> 이래야 관찰 가능한 변수가 됨.
           앱바에 로그인되면 true 출력함.
           Obx() : 컨트롤러 상태가 변경이 되면 자동으로 업데이트 됨.
        */
      ),
      body: ListView.separated( // 분리선 있는 리스트
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index), arguments: "arguments 속성 테스트"); // 클릭하면 상세 페이지로
            },
            title: Text("제목"),
            leading: Text("1"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget _navigation(BuildContext context) { // 왼쪽 메뉴 부분
    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context), // 뒤로가기 버튼 대신 드로우 메뉴 넣음.
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: (){
                  Get.to(() => WritePage()); // 글쓰기
                },
                child: Text(
                  "글쓰기",
                  style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54 )
                ),
              ),
              Divider(), // 분리선 넣음
              TextButton(
                onPressed: (){
                  Get.to(() => UserInfo()); // 회원정보 보기
                },
                child: Text(
                  "회원정보보기",
                  style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54 ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: (){
                  u.logout();                 // --->>> 로그아웃 처리
                  Get.to(() => LoginPage());  // 로그인 화면으로 이동
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54 ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
