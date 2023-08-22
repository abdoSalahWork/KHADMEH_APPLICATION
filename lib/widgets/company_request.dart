import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/company%20home/request_files.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:sizer/sizer.dart';

class CompanyRequestWidget extends StatelessWidget {
  const CompanyRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsetsDirectional.only(
          top: 20, bottom: 20, start: 20, end: 10),
      width: 100.w,
      // height: 42.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60.0.sp,
            height: 60.0.sp,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/images/image.png"),
                  fit: BoxFit.cover),
            ),
          ),
          spaceX(10.sp),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              coloredText(text: "Ahmad Khaled", fontSize: 14.sp),
              // spaceY(.sp),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Finished the procedure of',
                      style: coloredText(
                              text: "Finished the procedure of",
                              fontSize: 13.sp,
                              color: const Color(0xff919191))
                          .style,
                    ),
                    TextSpan(
                      text: ' Sara Fady',
                      style: coloredText(
                              text: "Sara Fady",
                              fontSize: 13.sp,
                              color: Theme.of(context).colorScheme.primary,
                              decoration: TextDecoration.underline)
                          .style,
                    ),
                  ],
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     coloredText(
              //         text: "Finished the procedure of",
              //         fontSize: 13.sp,
              //         color: const Color(0xff919191)),
              //     coloredText(
              //         text: "Sara Fady",
              //         fontSize: 13.sp,
              //         color: Theme.of(context).colorScheme.primary,
              //         decoration: TextDecoration.underline),
              //   ],
              // ),

              spaceY(7.sp),
              primaryBorderedButton(
                onTap: () {
                  Get.to(() => const RequestFilesPage());
                },
                alignment: AlignmentDirectional.centerStart,
                width: 25.w,
                height: 25.sp,
                radius: 20,
                text: coloredText(text: "View", fontSize: 12.sp),
                color: const Color(0xff919191),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
