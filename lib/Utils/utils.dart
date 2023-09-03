import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:sizer/sizer.dart';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_ios/local_auth_ios.dart';
// import 'package:path_provider/path_provider.dart';

// /
class Utils {
//   // static Future<void> takeContainer(
//   //     ScreenshotController controller, String imageName) async {
//   //   controller.capture().then((value) async {
//   //     final filePath = await FlutterFileDialog.saveFile(
//   //       params: SaveFileDialogParams(
//   //           localOnly: false,
//   //           // directory: pickedDirectory,
//   //           data: value,
//   //           // mimeType: mime(outputFile),
//   //           fileName: imageName
//   //           // replace: true,
//   //           ),
//   //     );
//   //   });
//   // }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) return null;
    final numreg = RegExp(r'\d');
    final bigAlphareg = RegExp(r'[A-Z]');
    final smallAlpgareg = RegExp(r'[a-z]');
    if (value.length < 8) {
      return ("password should be at least 8 characters");
    } else if (value.length > 20) {
      return ("password should be no more 20 characters");
    } else if (!numreg.hasMatch(value)) {
      return ("password should have at least 1 numbers");
    } else if (!smallAlpgareg.hasMatch(value)) {
      return ("password should have at least 1 small letter");
    } else if (!bigAlphareg.hasMatch(value)) {
      return ("password should have at least 1 capital letter");
    }
    return null;
  }

  static void showSnackBar({required String message, double? fontSize}) {
    final snackBar = SnackBar(
      content: coloredText(
        fontSize: fontSize,
        text: message,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

//   static Future<bool> reLoginHelper(DioError e) async {
//     logError(e.response!.data["message"] == "Please Login");
//     // var email = await AuthService().loadEmail();
//     // var password = await AuthService().loadPassword();
//     // var rem = await AuthService().loadRememberMe();
//     // if (email != "" && password != "") {
//     //   await AuthService().login(email, password, rem);
//     //   return true;
//     // } else {
//     MyDialogs.showWarningDialoge(
//         onProceed: () {
//           Get.offAll(() => LoginPage());
//         },
//         message: "you_have_to_login_again".tr,
//         yesBTN: "login".tr);
//     return false;
//     // }
//   }
  final Dio dio = Dio();
  Utils() {
    dio.options.headers['content-Type'] = 'multipart/form-data';

    readToken().then(
        (value) => dio.options.headers["authorization"] = "Bearer $value");
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
  }

  static const _storage = FlutterSecureStorage();
  static Future<String?> readToken() async {
    String? value = await _storage.read(key: "token");
    return value;
  }

  static Future deleteToken() async {
    await _storage.delete(key: "token");
  }

  static Future saveToken({required String token}) async {
    await _storage.write(key: "token", value: token);
  }

  static Future<String?> readLanguage() async {
    String? value = await _storage.read(key: "language");
    return value;
  }

  static Future deleteLanguage() async {
    await _storage.delete(key: "language");
  }

  static Future saveLanguage({required String language}) async {
    await _storage.write(key: "language", value: language);
  }

  static Future<String?> readRemmemberMe() async {
    String? value = await _storage.read(key: "rem");
    return value;
  }

  static Future deleteRemmemberMe() async {
    await _storage.delete(key: "rem");
  }

  static Future saveRemmemberMe({required String rem}) async {
    await _storage.write(key: "rem", value: rem);
  }

  static void showDialogBox(
      {required BuildContext context,
      List<Widget>? actions,
      Widget? content,
      Widget? title}) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: title,
            content: SizedBox(
              width: 100.w,
              child: content,
            ),
            actions: actions,
            surfaceTintColor: Colors.white,
          );
        });
  }

  static void circularIndicator() {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
  }

  static void customDialog(
      {TextStyle? titleStyle,
      CustomViewPosition? customViewPosition,
      required Widget child,
      String? title,
      Color? color,
      List<Widget>? actions,
      required BuildContext context,
      dynamic Function(dynamic)? onClose}) {
    Dialogs.materialDialog(
      onClose: onClose,

      // barrierColor: Colors.red,
      titleStyle: titleStyle ??
          coloredText(
                  text: "text", textAlign: TextAlign.start, fontSize: 13.0.sp)
              .style!,
      customViewPosition:
          customViewPosition ?? CustomViewPosition.BEFORE_MESSAGE,
      customView: Theme(
        data: ThemeData(
            useMaterial3: false,
            dialogTheme: DialogTheme(
                surfaceTintColor: Colors.red, backgroundColor: Colors.blue)),
        child: child,
      ),
      title: title,
      color: color ?? Colors.white,
      context: context,
      actions: actions,
      dialogWidth: 100.0.w,
    );
  }
}

// class AppUtil {
//   static Future<String> createFolderInAppDocDir(String folderName) async {
//     //Get this App Document Directory
//     final Directory? _appDocDir = await getExternalStorageDirectory();
//     //App Document Directory + folder name
//     final Directory _appDocDirFolder = Directory(
//         '${_appDocDir!.parent.parent.parent.parent.path}/$folderName/');

//     if (await _appDocDirFolder.exists()) {
//       //if folder already exists return path
//       logSuccess("existed");
//       return _appDocDirFolder.path;
//     } else {
//       //if folder not exists create folder and then return its path
//       try {
//         logWarning(_appDocDirFolder.path);
//         final Directory _appDocDirNewFolder =
//             await _appDocDirFolder.create(recursive: true);
//         logSuccess("created");
//         return _appDocDirNewFolder.path;
//       } catch (e) {
//         logError(e);
//         final Directory _appDocDirFolder =
//             Directory('${_appDocDir.path}/$folderName/');
//         if (await _appDocDirFolder.exists()) {
//           //if folder already exists return path
//           logSuccess("existed");
//           return _appDocDirFolder.path;
//         } else {
//           final Directory _appDocDirNewFolder =
//               await _appDocDirFolder.create(recursive: true);
//           logSuccess("created");
//           return _appDocDirNewFolder.path;
//         }
//       }
//     }
//   }
// }

// class LocalAuthApi {
//   static final _auth = LocalAuthentication();

//   static Future<bool> hasBiometrics() async {
//     try {
//       return await _auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       return false;
//     }
//   }

//   static Future<List<BiometricType>> getBiometrics() async {
//     try {
//       return await _auth.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       return <BiometricType>[];
//     }
//   }

//   static Future<bool> authenticate() async {
//     final isAvailable = await hasBiometrics();
//     if (!isAvailable) return false;

//     try {
//       return await _auth.authenticate(
//           localizedReason: 'Scan Fingerprint to Authenticate',
//           options: const AuthenticationOptions(
//             useErrorDialogs: true,
//           ),
//           authMessages: const <AuthMessages>[
//             AndroidAuthMessages(
//               signInTitle: 'Oops! Biometric authentication required!',
//               cancelButton: 'No thanks',
//             ),
//             IOSAuthMessages(
//               cancelButton: 'No thanks',
//             ),
//           ]);
//     } on PlatformException catch (e) {
//       logError(e.message!);
//       return false;
//     }
//   }
// }

// // class Noti {
// //   static Future initialize(
// //       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
// //     var androidInitialize =
// //         new AndroidInitializationSettings('mipmap/ic_launcher');
// //     var iOSInitialize = new DarwinInitializationSettings();
// //     var initializationsSettings = new InitializationSettings(
// //         android: androidInitialize, iOS: iOSInitialize);
// //     await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
// //   }

// //   static Future showBigTextNotification(
// //       {var id = 0,
// //       required String title,
// //       required String body,
// //       var payload,
// //       required FlutterLocalNotificationsPlugin fln}) async {
// //     AndroidNotificationDetails androidPlatformChannelSpecifics =
// //         new AndroidNotificationDetails(
// //       'you_can_name_it_whatever1',
// //       'channel_name',

// //       playSound: true,
// //       // sound: RawResourceAndroidNotificationSound('notification'),
// //       importance: Importance.max,
// //       priority: Priority.high,
// //     );

// //     var not = NotificationDetails(
// //         android: androidPlatformChannelSpecifics,
// //         iOS: DarwinNotificationDetails());
// //     await fln.show(0, title, body, not);
// //   }
// // }

void logSuccess(Object msg) {
  developer.log('\x1B[32m${msg.toString()}\x1B[0m');
}

void logInfo(Object msg) {
  developer.log('\x1B[34m${msg.toString()}\x1B[0m');
}

void logWarning(Object msg) {
  developer.log('\x1B[33m${msg.toString()}\x1B[0m');
}

void logError(Object msg) {
  developer.log('\x1B[31m${msg.toString()}\x1B[0m');
}

Widget spaceX(double x) {
  return SizedBox(width: x);
}

Widget spaceY(double y) {
  return SizedBox(height: y);
}

Widget primaryButton(
    {required Widget text,
    Color? color,
    double? radius,
    double? width,
    double? height,
    Gradient? gradient,
    void Function()? onTap,
    AlignmentGeometry? alignment}) {
  return Align(
    alignment: alignment ?? Alignment.center,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 15),
          gradient: gradient,
          color: color,
        ),
        width: width ?? 60.0.w,
        height: height ?? 45.0.sp,
        child: Center(child: text),
      ),
    ),
  );
}

Widget primaryBorderedButton(
    {required Widget text,
    required Color color,
    double? radius,
    double? width,
    double? height,
    void Function()? onTap,
    AlignmentGeometry? alignment}) {
  return Align(
    alignment: alignment ?? Alignment.center,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 15),
          border: Border.all(color: color),
        ),
        width: width ?? 60.0.w,
        height: height ?? 45.0.sp,
        child: Center(child: text),
      ),
    ),
  );
}

Text coloredText(
    {required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    double? fontSize,
    TextAlign? textAlign,
    TextStyle? textstyle}) {
  return Text(
    text,
    textAlign: textAlign,
    style: textstyle ??
        GoogleFonts.poppins(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 13.0.sp,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationColor: color,
        ),
  );
}

enum EmployeeType { recruitment, clean }

class Clipp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double firstFactor = 0;
    double secondFactor = size.height - 35;
    double thirdFactor = 0;
    double fourthFactor = size.height - 35;
    path.moveTo(firstFactor, 0);
    path.quadraticBezierTo(thirdFactor, firstFactor, 0, firstFactor);
    path.lineTo(0, fourthFactor);
    path.quadraticBezierTo(
      size.width / 3,
      size.height,
      size.width,
      secondFactor,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
