// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import '../helper/snakbar.dart';
import '../themes/colors.dart';
import '../widgets/my_buttom.dart';
import '../widgets/mytextField.dart';
import 'chat_page.dart';

class Regester extends StatefulWidget {
  const Regester({
    super.key,
  });

  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  bool isLoded = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController? email = TextEditingController();
    TextEditingController? password = TextEditingController();
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
                    Image.asset(
                      "assets/images/scholar.png",
                      width: 20.w,
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
                          'Regester',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontFamily: 'pacifico',
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
                      controller: password,
                      hinttext: 'Password',
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
                                .createUserWithEmailAndPassword(
                              email: email.text.trim(),
                              password: password.text.trim(),
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamedAndRemoveUntil(
                                context, ChatPage.id, (route) => false,
                                arguments: email.text.trim());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context,
                                  'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context,
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            showSnackBar(context, e.toString());
                          }
                          isLoded = false;
                          setState(() {});
                          // ignore: use_build_context_synchronously
                        }
                      },
                      child: const MyBottom(
                        titel: 'regester',
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'if you have account ',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
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
