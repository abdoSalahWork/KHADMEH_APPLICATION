// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';


// class CheckEmailPage extends StatelessWidget {
//   CheckEmailPage(
//       {super.key,
//       required this.phoneEmailFlag,
//       required this.sender,
//       this.code});
//   final bool phoneEmailFlag;
//   final String sender;
//   final String? code;
//   final formKey = GlobalKey<FormState>();
//   TextEditingController newPassController = TextEditingController();
//   TextEditingController confirmPassController = TextEditingController();
//   PasswordController _passwordController = Get.find();

//   String pin = "";
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: MyAppBar(title: ""),
//       body: Form(
//         key: formKey,
//         child: ListView(
//           primary: false,
//           padding: EdgeInsets.all(20),
//           children: [
//             Center(
//               child: Lottie.asset(
//                   phoneEmailFlag ? "assets/message.zip" : "assets/email.zip",
//                   width: w - 50,
//                   fit: BoxFit.cover

//                   // image: AssetImage("assets/images/email_check.gif"),
//                   // fit: BoxFit.cover,
//                   ),
//             ),
//             Center(
//               child: blackText(
//                 phoneEmailFlag
//                     ? "check_your_phone_messages".tr
//                     : "check_your_email".tr,
//                 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: SizedBox(
//                 width: 0.75 * w,
//                 child: greyText(
//                     phoneEmailFlag ? "phone_c".tr : "email_c".tr, 14,
//                     textAlign: TextAlign.center),
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: PinCodeTextField(
//                   appContext: context,
//                   validator: (s) {
//                     if (s!.length < 6) return "required";
//                   },
//                   autovalidateMode: AutovalidateMode.disabled,
//                   pinTheme: PinTheme(
//                     borderWidth: 3,
//                     fieldOuterPadding: EdgeInsets.symmetric(horizontal: 1),
//                     activeColor: Color(0xffBBBBBB),
//                     disabledColor: Color(0xffBBBBBB),
//                     shape: PinCodeFieldShape.underline,
//                     errorBorderColor: Colors.red,
//                     inactiveColor: Color(0xffBBBBBB),
//                     selectedColor: Color(0xffBBBBBB),
//                   ),
//                   length: 6,
//                   onChanged: (value) {
//                     pin = value;
//                   },
//                   onCompleted: (value) {
//                     logSuccess(value);
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             blackText("new_password".tr, 15),
//             SignUpTextField(
//               padding: EdgeInsets.all(0),
//               controller: newPassController,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               validator: validatePassword,
//             ),
//             SizedBox(height: 10),
//             blackText("confirm_password".tr, 15),
//             SignUpTextField(
//               padding: EdgeInsets.all(0),
//               controller: confirmPassController,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               validator: (s) {
//                 if (s!.isEmpty) {
//                   return "reqired";
//                 } else if (s != newPassController.text) {
//                   return "passwords are not match!";
//                 } else {
//                   return null;
//                 }
//               },
//               textInputAction: TextInputAction.done,
//             ),
//             SizedBox(height: 20),
//             WallpepredBTN(
//               text: "save".tr,
//               haveWallpaper: false,
//               width: 0.75 * w,
//               onTap: () async {
//                 if (formKey.currentState!.validate()) {
//                   if (!phoneEmailFlag) {
//                     logWarning("email");
//                     await _passwordController.resetPassWord(
//                         sender: sender,
//                         verrificationCode: pin,
//                         type: phoneEmailFlag ? 1 : 2,
//                         password: newPassController.text,
//                         passwordConfirm: confirmPassController.text);
//                   } else {
//                     logWarning("phone");
//                     logSuccess(code!);
//                     await _passwordController.resetPassWord(
//                         sender: sender,
//                         verrificationCode: pin,
//                         code: code,
//                         type: phoneEmailFlag ? 1 : 2,
//                         password: newPassController.text,
//                         passwordConfirm: confirmPassController.text);
//                   }
//                 }
//               },
//             ),
//             SizedBox(height: 10)
//           ],
//         ),
//       ),
//     );
//   }
// }

// String? validatePassword(String? value) {
//   final numreg = RegExp(r'\d');
//   final bigAlphareg = RegExp(r'[A-Z]');
//   final smallAlpgareg = RegExp(r'[a-z]');
//   if (value!.length < 6) {
//     return ("password should be at least 6 characters");
//   } else if (value.length > 20) {
//     return ("password should be no more 20 characters");
//   } else if (!numreg.hasMatch(value)) {
//     return ("password should have at least 1 numbers");
//   } else if (!smallAlpgareg.hasMatch(value)) {
//     return ("password should have at least 1 small letter");
//   } else if (!bigAlphareg.hasMatch(value)) {
//     return ("password should have at least 1 capital letter");
//   }
// }
