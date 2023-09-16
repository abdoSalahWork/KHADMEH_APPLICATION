import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/cleaning%20companies/controller/cleaning_companies_controller.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CleaningServiceWidget extends StatefulWidget {
  CleaningServiceWidget({super.key, this.added = false, required this.index});
  final int index;
  bool added;
  @override
  State<CleaningServiceWidget> createState() => _CleaningServiceWidgetState();
}

class _CleaningServiceWidgetState extends State<CleaningServiceWidget> {
  final CleaningCompanyController _cleaningCompanyController = Get.find();
  int durationCounter = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 35.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage("assets/images/image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          spaceX(10.sp),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              coloredText(text: "living room"),
              spaceY(3.sp),
              coloredText(
                  text: "150\$",
                  color: Theme.of(context).colorScheme.secondary),
              spaceY(3.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      durationCounter++;

                      setState(() {});
                    },
                    child: const Icon(
                      EvaIcons.plusCircleOutline,
                      color: Color(0xff919191),
                    ),
                  ),
                  spaceX(10.sp),
                  coloredText(text: "$durationCounter"),
                  spaceX(10.sp),
                  GestureDetector(
                    onTap: () {
                      if (durationCounter > 0) {
                        durationCounter--;
                      }
                      setState(() {});
                    },
                    child: const Icon(
                      EvaIcons.minusCircleOutline,
                      color: Color(0xff919191),
                    ),
                  )
                ],
              ),
              spaceY(6.sp),
              primaryButton(
                  onTap: widget.added
                      ? null
                      : () {
                          _cleaningCompanyController.bookService(widget.index);
                          widget.added = !widget.added;
                          setState(() {});
                        },
                  alignment: AlignmentDirectional.centerStart,
                  width: 30.w,
                  height: 25.sp,
                  text: coloredText(
                    text: widget.added ? "added".tr : "add".tr,
                    color: Colors.white,
                  ),
                  color: widget.added
                      ? Colors.grey
                      : Theme.of(context).colorScheme.primary)
            ],
          ))
        ],
      ),
    );
  }
}
