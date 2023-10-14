import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/admin_home.dart';
import 'package:khedma/Pages/HomePage/company%20home/company_home_page.dart';
import 'package:khedma/Pages/HomePage/user%20home/user_home_page.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/controller/auth_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/forget%20password/forget_passwrod_page.dart';
import 'package:khedma/Pages/log-reg%20pages/otp_page.dart';
import 'package:khedma/Pages/log-reg%20pages/user_type_page.dart.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/utils.dart';
import '../../widgets/underline_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsecureflag = true;
  bool _rememberMeFlag = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalController _globalController = Get.find();
  final formKey = GlobalKey<FormState>();

  void toggleObsecure() {
    _obsecureflag = !_obsecureflag;
    setState(() {});
  }

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _globalController.updateGuest(g: false);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ZeroAppBar(color: Theme.of(context).primaryColor),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            primary: false,
            children: [
              Opacity(
                opacity: 1,
                child: ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  // clipper: WaveClipperOne(flip: true),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      // borderRadius: BorderRadius.only(
                      //   bottomRight: Radius.elliptical(60.0.w, 20.0.w),
                      //   bottomLeft: Radius.elliptical(0, 10.0.w),
                      // ),
                    ),
                    width: 100.0.w,
                    height: 30.0.h,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Opacity(
                              opacity: 0,
                              child: Container(
                                margin: const EdgeInsets.only(left: 20, top: 5),
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 22.0.sp,
                                  ),
                                  // onTap: () => Get.back(),
                                ),
                              ),
                            )
                          ],
                        ),
                        spaceY(8.0.h),
                        Container(
                          width: 30.0.w,
                          height: 30.0.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.contain),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              spaceY(20.0.sp),
              Container(
                width: 100.0.w,
                // height: h,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: coloredText(
                            text: "login".tr,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            UnderlinedCustomTextField(
                                focusNode: _focusNodes[0],
                                controller: _emailController,
                                keyBoardType: TextInputType.emailAddress,
                                prefixIcon: const Icon(Icons.email_outlined),
                                hintText: "email".tr,
                                validator: (String? value) =>
                                    EmailValidator.validate(value!)
                                        ? null
                                        : "please_enter_a_valid_email".tr),
                            spaceY(5.0.sp),
                            UnderlinedCustomTextField(
                              focusNode: _focusNodes[1],
                              controller: _passwordController,
                              keyBoardType: TextInputType.visiblePassword,
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: _focusNodes[1].hasFocus
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Colors.grey,
                                  ),
                                  onPressed: toggleObsecure),
                              hintText: "password".tr,
                              obsecureText: _obsecureflag,
                              // validator: (String? value) {
                              //   if ((!(value!.length > 5) &&
                              //       value.isNotEmpty)) {
                              //     return "password_should_contain_more_than_5_characters"
                              //         .tr;
                              //   }
                              //   return null;
                              // },
                            ),
                            spaceY(10.0.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => ForgetPasswordPage(),
                                    );
                                  },
                                  child: Text(
                                    "forget_pass".tr,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            spaceY(10.0.sp),
                            SizedBox(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 25,
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.5);
                                        }
                                        return Colors.white;
                                      }),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        ),
                                      ), // Rounded Checkbox
                                      onChanged: (value) {
                                        _rememberMeFlag = value!;
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();

                                        if (value) {
                                          // MyDialogs.showWarningDialoge3(
                                          //     onProceed: () {
                                          //       Get.back();
                                          //     },
                                          //     message: "check_dialoge".tr,
                                          //     yesBTN: 'close'.tr);
                                        }
                                        setState(() {});
                                      },
                                      value: _rememberMeFlag,
                                    ),
                                  ),
                                  spaceX(10),
                                  GestureDetector(
                                    onTap: () {
                                      _rememberMeFlag = !_rememberMeFlag;
                                      setState(() {});
                                    },
                                    child: coloredText(
                                        text: "remember".tr,
                                        fontSize: 14.0.sp,
                                        color: Colors.grey.shade800),
                                  )
                                ],
                              ),
                            ),
                            spaceY(10.0.sp),
                            primaryButton(
                              width: 40.0.w,
                              height: 40.0.sp,
                              color: Theme.of(context).primaryColor,
                              radius: 25,
                              text: coloredText(
                                  text: "login".tr,
                                  color: Colors.white,
                                  fontSize: 15.0.sp),
                              onTap: () async {
                                FocusManager.instance.primaryFocus?.unfocus();

                                if (formKey.currentState!.validate()) {
                                  LoginStates state =
                                      await _authController.handleNormalSignIn(
                                    userName: _emailController.text,
                                    password: _passwordController.text,
                                    saveToken: _rememberMeFlag,
                                  );
                                  if (state == LoginStates.login) {
                                    if (_globalController.me.userType ==
                                        "user") {
                                      Get.offAll(
                                        () => const UserHomePage(),
                                      );
                                    } else if (_globalController.me.userType ==
                                        "company") {
                                      Get.offAll(
                                        () => const CompanyHomePage(),
                                      );
                                    } else {
                                      Get.to(() => const AdminHomePage());
                                    }
                                  } else if (state == LoginStates.needsVerify) {
                                    Get.to(
                                      () => OTPPage(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                                  } else if (state ==
                                      LoginStates.accountNotFound) {
                                    Utils.showSnackBar(
                                        message: "Account not found!!");
                                  } else if (state == LoginStates.blocked) {
                                    Utils.showSnackBar(
                                        message:
                                            "This User Is Not Found or blocked");
                                  } else {
                                    Utils.showSnackBar(
                                        message:
                                            "Your password is incorrect!!");
                                  }
                                }
                              },
                            ),
                            spaceY(10.0.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 20.0.w,
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                coloredText(
                                    text: "or_login_with".tr,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                                Container(
                                  width: 20.0.w,
                                  height: 1,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            spaceY(10.0.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Utils.showDialogBox(
                                      context: context,
                                      title: Center(
                                        child: coloredText(
                                          fontSize: 19.sp,
                                          // fontWeight: FontWeight.w600,
                                          text: "select".tr,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      actions: [
                                        primaryButton(
                                          onTap: () async {
                                            Get.back();
                                            String? token =
                                                await _authController
                                                    .handleGoogleSignIn(
                                                        saveToken:
                                                            _rememberMeFlag,
                                                        login: true);

                                            if (token != null) {
                                              if (_globalController
                                                      .me.userType ==
                                                  "user") {
                                                Get.off(
                                                    () => const UserHomePage(),
                                                    transition:
                                                        Transition.downToUp);
                                              } else {
                                                Get.off(
                                                    () =>
                                                        const CompanyHomePage(),
                                                    transition:
                                                        Transition.downToUp);
                                              }
                                            }
                                          },
                                          text: coloredText(
                                            text: "login".tr,
                                            color: Colors.white,
                                          ),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        spaceY(10.sp),
                                        primaryBorderedButton(
                                          onTap: () {
                                            Get.back();

                                            Utils.showDialogBox(
                                              context: context,
                                              title: Center(
                                                child: coloredText(
                                                  fontSize: 19.sp,
                                                  // fontWeight: FontWeight.w600,
                                                  text: "select".tr,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              ),
                                              actions: [
                                                primaryButton(
                                                  onTap: () async {
                                                    Get.back();

                                                    String? token =
                                                        await _authController
                                                            .handleGoogleSignIn(
                                                                saveToken:
                                                                    _rememberMeFlag,
                                                                login: false);

                                                    if (token != null) {
                                                      Get.off(
                                                        () =>
                                                            const UserHomePage(),
                                                      );
                                                    }
                                                  },
                                                  text: coloredText(
                                                    text: "user".tr,
                                                    color: Colors.white,
                                                  ),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                                spaceY(10.sp),
                                                primaryBorderedButton(
                                                  onTap: () async {
                                                    Get.back();

                                                    String? token =
                                                        await _authController
                                                            .handleGoogleSignIn(
                                                                saveToken:
                                                                    _rememberMeFlag,
                                                                login: false);

                                                    if (token != null) {
                                                      Get.off(
                                                        () =>
                                                            const CompanyHomePage(),
                                                      );
                                                    }
                                                  },
                                                  text: coloredText(
                                                    text: "company".tr,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              ],
                                            );
                                          },
                                          text: coloredText(
                                            text: "register".tr,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ],
                                    );
                                    // String? token = await _authController
                                    //     .handleGoogleSignIn(
                                    //         saveToken: _rememberMeFlag);

                                    // if (token != null) {
                                    //   if (userType == "user") {
                                    //     Get.off(() => const UserHomePage(),
                                    //         );
                                    //   } else {
                                    //     Get.off(() => const CompanyHomePage(),
                                    //         );
                                    //   }
                                    // }
                                  },
                                  child: Container(
                                    width: 40.0.sp,
                                    height: 40.0.sp,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.2)),
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.1)),
                                    child: Center(
                                      child: Image(
                                        width: 20.0.sp,
                                        height: 20.0.sp,
                                        image: const AssetImage(
                                            "assets/images/google.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Utils.showToast(message: "Facebook soon");

//                                     final LoginResult result = await FacebookAuth
//                                         .instance
//                                         .login(); // by default we request the email and the public profile
// // or FacebookAuth.i.login()
//                                     if (result.status == LoginStatus.success) {
//                                       // you are logged
//                                       final AccessToken accessToken =
//                                           result.accessToken!;
//                                       logSuccess(accessToken.token);
//                                     } else {
//                                       logError(result.status);
//                                       logError(result.message!);
//                                     }
                                    // var res = await Dio()
                                    //     .get("https://khdmah.online");

                                    // await Printing.layoutPdf(
                                    //     format: PdfPageFormat.a3,
                                    //     name: "contract",
                                    //     onLayout:
                                    //         (PdfPageFormat format) async =>
                                    //             await Printing.convertHtml(
                                    //               format: format,
                                    //               html: res.data,
                                    //             ));
                                  },
                                  child: Container(
                                    width: 40.0.sp,
                                    height: 40.0.sp,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.2)),
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.1)),
                                    child: Center(
                                      child: Image(
                                        width: 20.0.sp,
                                        height: 20.0.sp,
                                        image: const AssetImage(
                                            "assets/images/facebook.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Utils.showToast(message: "Apple soon");
                                  },
                                  child: Container(
                                    width: 40.0.sp,
                                    height: 40.0.sp,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.2)),
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.1)),
                                    child: Center(
                                      child: Image(
                                        width: 20.0.sp,
                                        height: 20.0.sp,
                                        image: const AssetImage(
                                            "assets/images/apple.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            spaceY(20.0.sp),
                            coloredText(
                              text: "dont_have_an_account".tr,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            GestureDetector(
                              onTap: () => Get.to(
                                () => UserTypePage(),
                              ),
                              child: coloredText(
                                  text: "create_an_account".tr,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0.sp,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Positioned(
          //   top: -100.0.w,
          //   left: -10.0.w,
          //   child: Container(
          //     width: 170.0.w,
          //     height: 170.0.w,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //         bottomRight: Radius.elliptical(120.0.w, 100.0.w),
          //         bottomLeft: Radius.elliptical(50.0.w, 15.w),
          //       ),
          //       color: Theme.of(context).colorScheme.primary,
          //     ),
          //   ),
          // ),

          Positioned(
            top: -282.0.w,
            left: -95.0.w,
            child: Container(
              width: 300.0.w,
              height: 300.0.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            top: -288.0.w,
            left: -100.0.w,
            child: Container(
              width: 300.0.w,
              height: 300.0.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            top: -292.0.w,
            left: -105.0.w,
            child: Container(
              width: 300.0.w,
              height: 300.0.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
            ),
          ),
          PositionedDirectional(
            top: 30,
            start: 20,
            child: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 22.0.sp,
              ),
              onTap: () => Get.back(),
            ),
          ),
          PositionedDirectional(
            top: 30,
            end: 20,
            child: GestureDetector(
              child: coloredText(text: "geust".tr, color: Colors.white),
              onTap: () {
                _globalController.guest = true;
                Get.offAll(() => UserHomePage());
              },
            ),
          )
        ],
      ),
    );
  }
}

// class Clipp extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     double firstFactor = 0;
//     double secondFactor = 3 * size.height / 4;
//     double thirdFactor = 0;
//     double fourthFactor = 3 * size.height / 4;
//     path.moveTo(firstFactor, 0);
//     path.quadraticBezierTo(thirdFactor, firstFactor, 0, firstFactor);
//     path.lineTo(0, fourthFactor);
//     path.quadraticBezierTo(
//       size.width / 3,
//       size.height,
//       size.width,
//       secondFactor,
//     );
//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }
