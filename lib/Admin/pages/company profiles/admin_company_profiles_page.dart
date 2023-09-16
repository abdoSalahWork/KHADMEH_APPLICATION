import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/search_text_field.dart';
import 'package:sizer/sizer.dart';

import './admin_company_details.dart';

class AdminCompanyProfilesPage extends StatelessWidget {
  const AdminCompanyProfilesPage({super.key});

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
                    text: "company_profiles".tr,
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
                    SearchTextField(
                      hintText: "${"search".tr} ...",
                      prefixIcon: const Icon(
                        EvaIcons.search,
                        color: Color(0xffAFAFAF),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: const Image(
                          width: 15,
                          height: 15,
                          image: AssetImage("assets/images/filter-icon.png"),
                        ),
                      ),
                    ),
                    spaceY(10.sp),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => const AdminCompanyCard(
                          img: "",
                          name: "Mohammed Ammourie",
                          phone: "+9561712313",
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

class AdminCompanyCard extends StatelessWidget {
  const AdminCompanyCard({
    super.key,
    required this.img,
    required this.name,
    required this.phone,
  });
  final String img;
  final String name;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => AdminCompanyDetailsPage()),
      child: Row(
        children: [
          Container(
            width: 55.0.sp,
            height: 55.0.sp,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/images/image.png"),
                  fit: BoxFit.cover),
            ),
          ),
          spaceX(10.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              coloredText(text: name, fontSize: 12.0.sp),
              spaceY(10.sp),
              coloredText(
                  text: phone,
                  fontSize: 11.0.sp,
                  color: const Color(0xff919191)),
            ],
          ),
          Spacer(),
          Icon(Icons.more_vert)
        ],
      ),
    );
  }
}
