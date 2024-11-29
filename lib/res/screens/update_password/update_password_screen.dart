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

import 'package:matka/res/screens/createpassword/change_password_controller.dart';


class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  late ChangePasswordController _controller;

  @override
  void initState() {
    _controller = Get.put(ChangePasswordController());
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
              'Update Password',
              style: AppStyles.instance.h1.copyWith(
                  color: AppColors.instance.primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 31),
            ),
            context.mheight(0.07),
            CustomTextField(
              controller: _controller.passwordController,
              hintText: 'Password',
              icon: Assets.instance.password,
              keyboardType: TextInputType.text,
              obscureText: true,
              maxLength: 16,
            ),
            context.mheight(0.02),
            CustomTextField(
              controller: _controller.confirmPasswordController,
              hintText: 'Confirm Password',
              icon: Assets.instance.password,
              keyboardType: TextInputType.text,
              obscureText: true,
              maxLength: 16,
            ),
            context.mheight(0.02),
            context.mheight(0.05),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                name: 'Update Password',
                onClick: () {
                  _controller.changePassword();
                },
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: rwidth * .04),
      ),
    );
  }
}
