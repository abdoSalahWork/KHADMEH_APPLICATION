import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/company%20home/company_home_page.dart';
import 'package:khedma/Pages/HomePage/user%20home/user_home_page.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/login_page.dart';

import '../../widgets/zero_app_bar.dart';

class TMPPage extends StatefulWidget {
  TMPPage({super.key, required this.rem, required this.x});
  final String rem;
  final bool x;

  @override
  State<TMPPage> createState() => _TMPPageState();
}

class _TMPPageState extends State<TMPPage> {
  final GlobalController _globalController = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.x) {
        if (widget.rem == "yes") {
          if (_globalController.me.userType == "user") {
            Get.offAll(() => const UserHomePage(),
                transition: Transition.downToUp);
          } else {
            Get.offAll(() => const CompanyHomePage(),
                transition: Transition.downToUp);
          }
        }
      } else {
        Get.offAll(() => LoginPage(), transition: Transition.downToUp);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: ZeroAppBar(color: Theme.of(context).colorScheme.primary),
    );
  }
}
