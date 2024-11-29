import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matka/main.dart';
import 'package:matka/res/colors/app_color.dart';
import 'package:matka/res/components/app_style.dart';
import 'package:matka/res/components/custom_text.dart';
import 'package:matka/res/components/custom_textfield.dart';
import 'package:matka/res/screens/login/login_controller.dart';
import 'package:matka/utils/sizes.dart';
import 'package:matka/utils/utils.dart';

import '../../assets/image_assets.dart';
import '../../components/custom_buttton.dart';
import '../../route/route_name.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            context.mheight(.04),
            CustomText(
              'Register Account',
              style: AppStyles.instance.h1.copyWith(
                  color: AppColors.instance.primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 31),
            ),
            context.mheight(0.05),
            CustomTextField(
              controller: _controller.nameController,
              hintText: 'Full Name',
              icon: Assets.instance.user,
              keyboardType: TextInputType.text,
            ),
            (rheight * .025).height,
            CustomTextField(
              controller: _controller.mobileController,
              hintText: 'Mobile No',
              icon: Assets.instance.phone,
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
            (rheight * .025).height,
            CustomTextField(
              controller: _controller.passwordController,
              hintText: 'Password',
              icon: Assets.instance.password,
              keyboardType: TextInputType.text,
              obscureText: true,
              maxLength: 16,
            ),
            (rheight * .025).height,
            CustomTextField(
              controller: _controller.confirmPasswordController,
              hintText: 'Confirm Password',
              icon: Assets.instance.password,
              keyboardType: TextInputType.text,
              obscureText: true,
              maxLength: 16,
            ),
            context.mheight(0.02),
            context.mheight(0.07),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                name: 'Register',
                onClick: () {
                  Utils.instance.hideKeyboard();
                  _controller.registerUser();
                },
              ),
            ),
            15.height,
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Already registered account? ',
                  style: AppStyles.instance.h4,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login Here',
                      style: AppStyles.instance.h4.copyWith(
                          color: AppColors.instance.primaryColor,
                          fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAllNamed(RouteName.login_screen);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: rwidth * .04),
      ),
    );
  }
}
