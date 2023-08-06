import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../Pages/chat%20page/chat_page.dart';
import '../Utils/utils.dart';

// ignore: must_be_immutable
class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chatType,
  });
  final ChatType chatType;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const ChatPage(), transition: Transition.downToUp);
          },
          child: Container(
            width: 70.0.sp,
            height: 70.0.sp,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/images/image.png"),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        spaceX(10),
        Expanded(
          child: SizedBox(
            height: 70.0.sp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    coloredText(text: 'lorem ipsun', fontSize: 13.0.sp),
                    coloredText(
                        text: DateFormat('hh:mm a').format(
                          DateTime.now().add(
                            Duration(
                              hours: Random().nextInt(24),
                              minutes: Random().nextInt(60),
                            ),
                          ),
                        ),
                        fontSize: 12.0.sp,
                        color: Colors.grey),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    chatType == ChatType.typing
                        ? coloredText(
                            text: "Typing...",
                            fontSize: 12.0.sp,
                            color: const Color(0xff2BB294),
                          )
                        : coloredText(
                            text: "Lorem Ipsum dolor sit".length > 15
                                ? "${"Lorem Ipsum dolor sit".substring(0, 15)}..."
                                : "Lorem Ipsum dolor sit",
                            fontSize: 12.0.sp,
                            color: const Color(0xff919191),
                          ),
                    chatType == ChatType.recieved
                        ? Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Center(
                              child: coloredText(
                                text: "3",
                                color: Colors.white,
                              ),
                            ),
                          )
                        : chatType == ChatType.delivered ||
                                chatType == ChatType.read
                            ? Icon(
                                EvaIcons.doneAll,
                                color: chatType == ChatType.delivered
                                    ? const Color(0xff617FEA)
                                    : const Color(0xff919191),
                              )
                            : Container()
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

enum ChatType {
  typing,
  recieved,
  delivered,
  read,
}
