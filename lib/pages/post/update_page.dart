import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_form_field.dart';
import 'package:flutter_blog/components/custom_textarea.dart';
import 'package:flutter_blog/pages/post/detail_page.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                hint: "Title",
                funValidator: validateTitle(),
                value: "제목1~" * 2,
              ),
              CustomTextArea(
                hint: "Content",
                funValidator: validateContent(),
                value: "내용1~" * 20,
              ),
              // homepage -> detailpage -> updatepage
              CustomElevatedButton(
                text: "글 수정하기",
                funPageRoute: () {
                  if(_formKey.currentState!.validate()) {
                    // 같은 page가 있으면 이동할 때 덮어씌우기 이게 최고!!
                    Get.back(); // 상태관리 GetX 라이브러리 - Obs 로 데이터 갱신시킴.
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
