import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/user/login_page.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const CustomElevatedButton({super.key, required this.text, this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: funPageRoute,
      child: Text("$text"),
    );
  }
}

