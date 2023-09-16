// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/jobs/controller/jobs_controller.dart';
import 'package:khedma/Pages/HomePage/cleaning%20companies/controller/cleaning_companies_controller.dart';
import 'package:khedma/Pages/HomePage/company%20home/company_home_page.dart';
import 'package:khedma/Pages/HomePage/controllers/advertisment_controller.dart';
import 'package:khedma/Pages/HomePage/user%20home/user_home_page.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/controller/auth_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/login_page.dart';
import 'package:khedma/Utils/utils.dart';

import '../Select%20Language%20Page/select_language_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final GlobalController _globalController = Get.put(GlobalController());
  final JobsController _jobsController = Get.put(JobsController());
  final CleaningCompanyController _cleaningCompanyController =
      Get.put(CleaningCompanyController());
  final AdvertismentController _advertismentController =
      Get.put(AdvertismentController());
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _globalController.getCities();
    _globalController.getCountries();
    _globalController.getRegions();
    _globalController.setLocale();
    _globalController.getComplexion();
    _globalController.getRelegions();
    _globalController.getMaritalStatuss();
    _globalController.getCertificates();
    _globalController.getlanguages();
    _globalController.getjobs();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        String? rem = await Utils.readRemmemberMe();
        String? lang = await Utils.readLanguage();
        if (lang == null) {
          Get.offAll(() => SelectLanguagePage(),
              transition: Transition.downToUp);
        } else {
          await _globalController.setLocale();
          bool x = await _globalController.getMe();
          if (x) {
            if (rem == "yes") {
              if (_globalController.me.userType == "user") {
                Get.offAll(() => const UserHomePage(),
                    transition: Transition.downToUp);
              } else if (_globalController.me.userType == "company") {
                Get.offAll(() => const CompanyHomePage(),
                    transition: Transition.downToUp);
              } else {
                Get.off(() => LoginPage(), transition: Transition.downToUp);
              }
            } else {
              Get.off(() => LoginPage(), transition: Transition.downToUp);
            }
          } else {
            Get.off(() => LoginPage(), transition: Transition.downToUp);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash_background.png"),
              fit: BoxFit.cover),
        ),
        child: Align(
          child: Container(
            width: w / 3.5,
            height: h / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash_logo.png"),
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
