import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class MyBottom extends StatelessWidget {
  final String titel;
 const MyBottom({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            width: double.infinity,
            height: 5.h,
            child:  Center(child: Text(titel)),
           );
  }
}