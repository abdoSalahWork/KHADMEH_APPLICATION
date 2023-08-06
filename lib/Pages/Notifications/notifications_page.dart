import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/utils.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          // surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: coloredText(text: "notifications".tr, fontSize: 15.0.sp),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 100.0.w,
                    child: Row(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffE2E2E2),
                          ),
                          // child: Image(
                          //   image: AssetImage(getnotificationImage(
                          //       _notificationsController
                          //           .notifications[index].notificationType!)),
                          //   width: 40,
                          //   height: 40,
                          // ),
                        ),
                        spaceX(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              coloredText(
                                  text: "loremads asd lan dasd ads ",
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold),
                              spaceY(10),
                              coloredText(
                                text: "dd/M/y",
                                fontSize: 11.0.sp,
                                color: Colors.grey,
                              ),
                              // DateFormat('dd/M/y').format(DateTime.parse(
                              //         c.notifications[index].createdAt!)) +
                              //     " " +
                              //     DateFormat('hh:mm a').format(
                              //         DateTime.parse(c.notifications[index]
                              //             .createdAt!)),
                              // 11),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => Container(
                  width: 100.0.w,
                  height: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: const Color(0xffD8D8D8),
                ),
            itemCount: 5));
  }
}
