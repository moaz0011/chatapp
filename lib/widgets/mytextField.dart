// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class MytextFormFiled extends StatelessWidget {
  final String hinttext;
   TextEditingController controller=TextEditingController();
   MytextFormFiled({super.key, required this.hinttext,   required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty){
          return "this is required";
        }
        return null;
      },  
      controller: controller,
      decoration: InputDecoration(
          hintText: hinttext,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
