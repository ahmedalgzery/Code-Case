import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonPercent extends StatelessWidget {
  const CustomButtonPercent({
    super.key,
    required this.text,
    required this.onTap, required this.index, required this.isSlected,
    
  });
  final String text;
  final int index,isSlected;
   
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.r), color:index== isSlected? Colors.amber: Colors.grey.withOpacity(.5)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}
