// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:chat_app/model/messages.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../themes/colors.dart';

CollectionReference messages =
    FirebaseFirestore.instance.collection('messages');

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController message = TextEditingController();
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments.toString();
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('Date', descending: true).snapshots(),
      builder: (context, snapshot) {
        List<Message> messageList = [];
        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          messageList.add(Message.fromJson(snapshot.data!.docs[i]));
        }
        if (snapshot.hasData) {
          //print(messageList);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: MyColors.primaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/scholar.png",
                      width: 10.w,
                    ),
                    const Text('moaz app'),
                  ],
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: controller,
                      itemCount: messageList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ChatBuble(
                          message: messageList[index].message,
                          me: messageList[index].id == email,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: message,
                      decoration: InputDecoration(
                        hintText: "Send message",
                        suffixIcon: InkWell(
                          onTap: () {
                            messages.add({
                              'message': message.text.trim(),
                              'Date': DateTime.now(),
                              'id': email
                            });
                            message.clear();
                            controller.animateTo(0,
                                duration: const Duration(microseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          },
                          child: const Icon(
                            Icons.send,
                            color: MyColors.primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: MyColors.primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: MyColors.primaryColor)),
                      ),
                    ),
                  )
                ],
              ));
        } else {
          return const Scaffold(
            backgroundColor: Colors.cyan,
            body: Center(
              child: Text('i love you  ♥'),
            ),
          );
        }
      },
    );
  }
}
