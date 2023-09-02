import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../themes/colors.dart';

// ignore: must_be_immutable
class ChatBuble extends StatelessWidget {
  String message;
  bool me;
  ChatBuble({super.key, required this.message,required this.me});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:me? Alignment.bottomRight:Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(32),
            topRight: const Radius.circular(32),
            bottomRight:me? const Radius.circular(0):const Radius.circular(32),
            bottomLeft:me? const Radius.circular(32):const Radius.circular(0)
          ),
          color: me?const Color(0xff006d84):MyColors.primaryColor,
        ),
        margin: EdgeInsets.all(10.sp),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
