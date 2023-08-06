import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/utils.dart';
import '../../widgets/underline_text_field.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({super.key});

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  bool valid = false;
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        // surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: coloredText(text: "Change password", fontSize: 15.0.sp),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: key,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          primary: false,
          children: [
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: _focusNodes[0],
              controller: _oldPasswordController,
              keyBoardType: TextInputType.visiblePassword,
              hintText: "Current password",
              validator: (s) => s!.isEmpty ? "can't be empty" : null,
              onchanged: (s) {
                valid = _oldPasswordController.text.isNotEmpty &&
                    _passwordConfirmController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty;
                setState(() {});
              },
            ),
            spaceY(20.0.sp),
            UnderlinedCustomTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: _focusNodes[1],
              controller: _passwordController,
              keyBoardType: TextInputType.visiblePassword,
              hintText: "New password",
              validator: (s) => s!.isEmpty ? "can't be empty" : null,
              onchanged: (s) {
                valid = _oldPasswordController.text.isNotEmpty &&
                    _passwordConfirmController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty;
                setState(() {});
              },
            ),
            spaceY(20.0.sp),
            UnderlinedCustomTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: _focusNodes[2],
              controller: _passwordConfirmController,
              keyBoardType: TextInputType.visiblePassword,
              hintText: "Rewrite new password",
              validator: (s) => s!.isEmpty ? "can't be empty" : null,
              onchanged: (s) {
                valid = _oldPasswordController.text.isNotEmpty &&
                    _passwordConfirmController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty;
                setState(() {});
              },
            ),
            spaceY(60.0.sp),
            primaryButton(
                text: coloredText(text: "apply".tr, color: Colors.white),
                gradient: valid
                    ? LinearGradient(
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                      )
                    : null,
                color: !valid ? const Color(0xffB2B2B2) : null)
          ],
        ),
      ),
    );
  }
}
