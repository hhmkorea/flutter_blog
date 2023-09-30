import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funValidator;
  final String? value;

  const CustomTextArea({super.key, required this.hint, required this.funValidator, this.value});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        initialValue: value ?? "",
        maxLines: 10,
        validator: funValidator,
        decoration: InputDecoration(
          hintText: "Enter $hint", // null 안정성을 위해 변수를 이렇게 지정.
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
