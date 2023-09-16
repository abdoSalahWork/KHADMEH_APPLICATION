import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/categories/create_category_page.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:sizer/sizer.dart';

class AdminCategoriesPage extends StatelessWidget {
  const AdminCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
        ])),
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 15.h,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  coloredText(
                    text: "categories".tr,
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                  spaceX(10)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                width: 100.w,
                child: Column(
                  children: [
                    spaceY(10.sp),
                    primaryBorderedButton(
                        onTap: () {
                          Get.to(
                            () => const AdminCreateCategory(),
                          );
                        },
                        width: 100.w,
                        text: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(EvaIcons.plus,
                                color: Colors.black, size: 20.sp),
                            spaceX(10.sp),
                            coloredText(text: "create_category".tr),
                          ],
                        ),
                        color: Colors.black),
                    spaceY(30.sp),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => AdminCategoryCard(
                          img: "",
                          name: "cleaning".tr,
                        ),
                        separatorBuilder: (context, index) => Column(
                          children: [
                            spaceY(5.sp),
                            const Divider(color: Color(0xffE5E5E5)),
                            spaceY(5.sp),
                          ],
                        ),
                        itemCount: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminCategoryCard extends StatelessWidget {
  const AdminCategoryCard({
    super.key,
    required this.img,
    required this.name,
  });
  final String img;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Color(0xffF8F8F8)),
      child: Row(
        children: [
          Icon(
            Icons.place,
            size: 30.sp,
          ),
          spaceX(10.sp),
          coloredText(text: name, fontSize: 12.0.sp),
          const Spacer(),
          Theme(
            data: ThemeData(primaryColor: Colors.white),
            child: PopupMenuButton(
              constraints: BoxConstraints(
                minWidth: 2.0 * 56.0,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(EvaIcons.editOutline, size: 15.sp),
                      spaceX(5.sp),
                      coloredText(text: 'edit'.tr, fontSize: 12.0.sp),
                    ],
                  ),
                  onTap: () {},
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(EvaIcons.trash2Outline, size: 15.sp),
                      spaceX(5.sp),
                      coloredText(text: 'delete'.tr, fontSize: 12.0.sp),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
              child: const Icon(
                EvaIcons.moreVertical,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
