import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGst extends StatelessWidget {
  const CustomGst({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 25.sp, color: Colors.black, fontWeight: FontWeight.w700),
    );
  }
}