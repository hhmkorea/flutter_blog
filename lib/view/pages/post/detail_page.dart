import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final int id; // 게시물 번호

  const DetailPage(this.id); // 생성자로 id 받음

  @override
  Widget build(BuildContext context) {

    //String data = Get.arguments; // argument 받는 테스트

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 배치
          children: [
            Text( "글 제목!!", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 35 ) ),
            Divider(),
            Row( // 삭제, 수정 버튼 가로 영역으로 보여줌
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.off(HomePage()); // HomePage() : 리스트로 갱신되어 이동됨, 상태관리로 갱신시킬 수 있음.
                  },
                  child: Text("삭제"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.to(UpdatePage()); // UpdatePage() : 수정 화면으로 이동
                  },
                  child: Text("수정"),
                ),
              ],
            ),
            Expanded( // Expanded : 글제목 제외한 나머지 부분 영역을 차지함.
              child: SingleChildScrollView( // 높이가 없으므로 Expanded 붙여야 함.
                child: Text("글 내용!!" * 500), // 글 내용 보여줌.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
