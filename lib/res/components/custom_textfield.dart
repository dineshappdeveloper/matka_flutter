import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:matka/res/components/svg.dart';
import 'package:matka/utils/sizes.dart';

import '../../main.dart';
import '../colors/app_color.dart';
import 'app_style.dart';
import 'custom_text.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String icon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool enable;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.obscureText = false,
    this.enable = true,
    this.keyboardType = TextInputType.text,
    this.maxLength,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool pass = true;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 1,color: Colors.grey.withOpacity(.3))
      ),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: AppColors.instance.lightprimary,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(child: SvgImage(icon: widget.icon, height: 17, width: 17,color: AppColors.instance.primaryColor,)),
          ),
          10.width,
          Expanded(
            child: TextField(
              enabled: widget.enable,
              controller: widget.controller,
              obscureText: widget.obscureText ? pass : false,
              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),
              keyboardType: widget.keyboardType,
              inputFormatters: [
                if (widget.maxLength != null) LengthLimitingTextInputFormatter(widget.maxLength),
              ],
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  suffixIcon: widget.obscureText
                      ? IconButton(
                    icon: Icon(
                      pass ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    onPressed: () {
                      setState(() {
                        pass = !pass;
                      });
                    },
                  )
                      : null,
                  hintText: widget.hintText,
                  hintStyle: AppStyles.instance.h3.copyWith(fontSize: 13,color: AppColors.instance.graycolor),
                  border: InputBorder.none
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: rwidth*.03),
    );
  }
}

class mobileTextField extends StatelessWidget {
  final String hintText;
  final String icon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool enable;
  final int? maxLength;

  const mobileTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.obscureText = false,
    this.enable = true,
    this.keyboardType = TextInputType.text,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 1,color: Colors.grey.withOpacity(.3))
      ),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: AppColors.instance.lightprimary,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(child: SvgImage(icon: icon, height: 17, width: 17,color: AppColors.instance.primaryColor,)),
          ),
          10.width,
          const CustomText(
            "+91 - ",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
          ),
          Expanded(
            child: TextField(
              enabled: enable,
              controller: controller,
              obscureText: obscureText,
              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),
              keyboardType: keyboardType,
              inputFormatters: [
                if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
              ],
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppStyles.instance.h3.copyWith(fontSize: 13,color: AppColors.instance.graycolor),
                  border: InputBorder.none
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: rwidth*.03),
    );
  }
}
