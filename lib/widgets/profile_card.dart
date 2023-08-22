import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../Pages/HomePage/employees/employee.dart';
import '../Utils/utils.dart';

// ignore: must_be_immutable
class ProfileCard extends StatelessWidget {
  ProfileCard({
    super.key,
    this.isOffer = false,
    this.employeeType = EmployeeType.recruitment,
    this.trailing,
  });
  bool isOffer = false;
  final EmployeeType employeeType;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            logSuccess(employeeType);
            Get.to(() => EmployeePage(employeeType: employeeType),
                transition: Transition.rightToLeft);
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
                        text: employeeType == EmployeeType.clean
                            ? '30\$/H'
                            : '300\$/Y',
                        color: isOffer
                            ? const Color(0xff919191)
                            : Theme.of(context).colorScheme.tertiary,
                        fontSize: 9.0.sp,
                        decoration: isOffer ? TextDecoration.lineThrough : null,
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(EvaIcons.star, color: Colors.yellow),
                  spaceX(5),
                  coloredText(
                    text: "4.5",
                    fontSize: 13.0.sp,
                    color: Colors.black,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
