import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/search_text_field.dart';
import 'package:sizer/sizer.dart';

class AdminAccountStatmentPage extends StatefulWidget {
  const AdminAccountStatmentPage({super.key});

  @override
  State<AdminAccountStatmentPage> createState() =>
      _AdminAccountStatmentPageState();
}

class _AdminAccountStatmentPageState extends State<AdminAccountStatmentPage> {
  @override
  void initState() {
    super.initState();
  }

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
                    text: "account_statment".tr,
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
                          itemBuilder: (context, index) =>
                              const AccountStatmentCard(),
                          separatorBuilder: (context, index) => spaceY(10.sp),
                          itemCount: 20),
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

class AccountStatmentCard extends StatelessWidget {
  const AccountStatmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.all(20),
      height: 25.h,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          depositLine(title: "depositor".tr, content: "Depositor name"),
          depositLine(title: "beneficiary".tr, content: "Beneficiary name"),
          depositLine(title: "deposit_type".tr, content: "Advertisement"),
          depositLine(title: "payment_date".tr, content: "19-10-1231"),
          Row(
            children: [
              SizedBox(
                width: 40.w,
                child:
                    coloredText(text: "${"amount".tr}: ", color: Colors.grey),
              ),
              Expanded(
                child: coloredText(
                  text: "500  KWD",
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
          // depositLine(title: "amount".tr, content: "lorem ipsum etc"),
        ],
      ),
    );
  }

  Row depositLine({
    required String title,
    required String content,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 40.w,
          child: coloredText(text: "$title: ", color: Colors.grey),
        ),
        Expanded(child: coloredText(text: content, fontSize: 12.sp))
      ],
    );
  }
}
