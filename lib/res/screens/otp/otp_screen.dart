import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:matka/utils/sizes.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


import '../../../main.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_text.dart';
import '../login/login_controller.dart';


class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  late LoginController _controller;

  int status = 0;

  @override
  void initState() {
    status = Get.arguments;
    _controller = Get.put(LoginController());
    super.initState();
    _controller.startTimer();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              context.mheight(.08),
          CustomText(
            'Enter OTP',
            style: AppStyles.instance.h1
                .copyWith(color: AppColors.instance.primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 31),
          ),
          context.mheight(.02),
          CustomText(
            'OTP has been sent to your mobile number \n +91${_controller.mobileController.text}',
            style: AppStyles.instance.h4.copyWith(fontWeight: FontWeight.w400),
            maxLines: 2,
          ),
          (rheight * .04).height,
          SizedBox(
            width: rwidth * .6,
            child: OTPTextField(
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              width: rwidth,
              length: 4,
              fieldWidth: 51,
              style: AppStyles.instance.h3.copyWith(color: Colors.black),
              fieldStyle: FieldStyle.box,
              onChanged: (pin) {
                _controller.otp = pin;
              },
            ),
          ),
          (rheight * .02).height,
          Align(
              alignment: Alignment.topRight,
              child: Obx(() => _controller.canResend.value? GestureDetector(
                onTap: () {
                  _controller.resendOTP();
                },
                child: CustomText('Resend OTP ?',
                style: AppStyles.instance.h4.copyWith(
                    color: AppColors.instance.primaryColor,
                    fontWeight: FontWeight.w700),),
              ):CustomText('00:${_controller.secondsRemaining}',
                style: AppStyles.instance.h4.copyWith(
                    color: AppColors.instance.primaryColor,
                    fontWeight: FontWeight.w700),)
              )),


      (rheight * .06).height,
      CustomButton(name: "Verify", onClick: () {
        if (status == 1) {
          _controller.verifyUser();
        } else if (status == 2) {
          _controller.verifyForgotOTP();
        }
      }),
      ],
    ).paddingSymmetric(horizontal: rwidth * .06),)
    );
  }
}
