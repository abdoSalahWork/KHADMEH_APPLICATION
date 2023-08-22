import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Utils/utils.dart';

// ignore: must_be_immutable
class CompanyEmployeeCard extends StatelessWidget {
  CompanyEmployeeCard(
      {super.key, this.trailing, required this.booked, this.onTap});
  bool isOffer = false;
  final Widget? trailing;
  bool booked;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70.0.sp,
            height: 70.0.sp,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/images/image.png"),
                  fit: BoxFit.cover),
            ),
          ),
          spaceX(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        coloredText(text: 'lorem ipsun', fontSize: 13.0.sp),
                        spaceX(8),
                        coloredText(
                          text: '300\$/Y',
                          color: isOffer
                              ? const Color(0xff919191)
                              : Theme.of(context).colorScheme.tertiary,
                          fontSize: 9.0.sp,
                          decoration:
                              isOffer ? TextDecoration.lineThrough : null,
                        ),
                        !isOffer ? Container() : spaceX(8),
                        !isOffer
                            ? Container()
                            : coloredText(
                                text: '300\$/2y',
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: 9.0.sp,
                              ),
                      ],
                    ),
                    trailing ?? Container(),
                  ],
                ),
                spaceY(10),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF8F8F8),
                        border: Border.all(
                          color: const Color(0xffE8E8E8),
                        ),
                      ),
                      child: coloredText(
                        text: "Nurse",
                        color: const Color(0xff787878),
                        fontSize: 11.0.sp,
                      ),
                    ),
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) =>
                        spaceX(5),
                  ),
                ),
                spaceY(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      EvaIcons.pin,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 15.0.sp,
                    ),
                    spaceX(3),
                    coloredText(
                      text: 'Philippines',
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 13.0.sp,
                    ),
                  ],
                ),
                spaceY(10),
                primaryButton(
                  alignment: AlignmentDirectional.centerStart,
                  color: booked ? const Color(0xff9A9A9A) : Colors.black,
                  width: 35.w,
                  height: 30.sp,
                  radius: 10,
                  text: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      coloredText(text: "Book", color: Colors.white),
                      !booked ? Container() : spaceX(10),
                      !booked
                          ? Container()
                          : Icon(
                              EvaIcons.checkmarkCircle,
                              size: 15.sp,
                              color: Colors.white,
                            )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
