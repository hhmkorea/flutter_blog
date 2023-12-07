import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint; // 힌트
  final funValidator; // 유효성 체크
  final String? value; // 사용자가 입력한 값
  final controller;

  const CustomTextFormField({
    required this.hint,
    required this.funValidator,
    this.value,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5), // 아래 위로 공백 지정
      child: TextFormField(
        controller: controller,
        initialValue: value , // "" 공백 넣으면 에러남.
        validator: funValidator,
        obscureText: hint == "Password" ? true : false, // 패스워드면 *로 가려서 보여줌.
        decoration: InputDecoration(
          hintText: "Enter $hint", // null 안정성을 위해 변수를 이렇게 지정. null 에러 방지.
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
