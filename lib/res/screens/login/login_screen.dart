import 'package:flutter/gestures.dart';
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
import '../../route/route_name.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController _controller;

  @override
  void initState() {
    _controller = Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          Get.offAllNamed(RouteName.registerScreen);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.mheight(.04),
              CustomText(
                'Login Here',
                style: AppStyles.instance.h1.copyWith(
                    color: AppColors.instance.primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 31),
              ),
              context.mheight(0.07),
              CustomTextField(
                controller: _controller.lMobileController,
                hintText: 'Mobile No',
                icon: Assets.instance.phone,
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
              (rheight * .025).height,
              CustomTextField(
                controller: _controller.lPasswordController,
                hintText: 'Password',
                icon: Assets.instance.password,
                keyboardType: TextInputType.text,
                obscureText: true,
                maxLength: 16,
              ),
              context.mheight(0.02),
              Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () => Get.toNamed(RouteName.forgotPassword),
                      child: CustomText(
                        'Forgot Password ?',
                        style: AppStyles.instance.h4.copyWith(
                            color: AppColors.instance.primaryColor,
                            fontWeight: FontWeight.w700),
                      ))),
              context.mheight(0.07),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  name: 'Login',
                  onClick: () {
                    _controller.loginUser();
                  },
                ),
              ),
              15.height,
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Don’t have an account? ',
                    style: AppStyles.instance.h4,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register',
                        style: AppStyles.instance.h4.copyWith(
                            color: AppColors.instance.primaryColor,
                            fontWeight: FontWeight.w700),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offAllNamed(RouteName.registerScreen);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: rwidth * .04),
        ),
      ),
    );
  }
}
