// ignore_for_file: unused_local_variable, must_be_immutable, use_build_context_synchronously, duplicate_ignore

import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/widgets/my_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import '../helper/snakbar.dart';
import '../themes/colors.dart';
import '../widgets/mytextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController? email = TextEditingController();
    TextEditingController? password = TextEditingController();
    bool isLoded = false;
    return ModalProgressHUD(
      inAsyncCall: isLoded,
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).viewPadding.top,
                    ),
                    Text(
                      'moaz chat app',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontFamily: 'pacifico',
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sginin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MytextFormFiled(
                      hinttext: 'Email',
                      controller: email,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MytextFormFiled(
                      hinttext: 'Password',
                      controller: password,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            isLoded = true;
                            setState(() {});
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email.text.trim(),
                                      password: password.text.trim());
                              Navigator.pushNamedAndRemoveUntil(
                                  context, ChatPage.id, (route) => false,
                                  arguments: email.text.trim());
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackBar(
                                    context, 'No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                showSnackBar(context,
                                    'Wrong password provided for that user.');
                              }
                            }
                            isLoded = false;
                            setState(() {});
                            // ignore: use_build_context_synchronously
                          }
                        },
                        child: const MyBottom(
                          titel: 'Login',
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'if you donot have account ',
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'Regester');
                          },
                          child: Text(
                            'Regester',
                            style: TextStyle(
                              color: const Color(0xffc7ede6),
                              fontSize: 12.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
