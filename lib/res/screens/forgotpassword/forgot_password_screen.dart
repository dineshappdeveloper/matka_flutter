import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matka/main.dart';
import 'package:matka/res/colors/app_color.dart';
import 'package:matka/res/components/app_style.dart';
import 'package:matka/res/components/custom_text.dart';
import 'package:matka/res/components/custom_textfield.dart';
import 'package:matka/utils/sizes.dart';

import '../../assets/image_assets.dart';
import '../../components/custom_buttton.dart';
import '../login/login_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late LoginController _controller;

  @override
  void initState() {
    _controller = Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.mheight(.08),
            CustomText(
              'Forgot Password',
              style: AppStyles.instance.h1.copyWith(
                  color: AppColors.instance.primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 31),
            ),
            context.mheight(0.07),
            CustomTextField(
              controller: _controller.mobileController,
              hintText: 'Mobile No',
              icon: Assets.instance.phone,
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
            (rheight * .025).height,
            context.mheight(0.05),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                name: 'Submit',
                onClick: () {
                  _controller.forgotPassword();
                },
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: rwidth * .04),
      ),
    );
  }
}
