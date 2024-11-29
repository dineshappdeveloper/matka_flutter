
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matka/utils/prefrence.dart';



import '../res/colors/app_color.dart';
import 'appcons.dart';

class Utils {
  Utils._();
  static final Utils instance = Utils._();

  // Factory constructor to return the same instance
  factory Utils() {
    return instance;
  }

  String formatDateString(String date) {
    DateTime parsedDate = DateTime.parse(date);
    DateFormat formatter = DateFormat('MMM dd yyyy');
    return formatter.format(parsedDate);
  }

  Future<String?> getToken() async {
    String? token = await PreferenceManager.instance.getString(TOKEN);
    if (token == null || token.isEmpty) {
      return null;
    }
    return token;
  }


  // Static method to show a snackbar
   void showSnackbar(String message, {String title = 'Info'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black54,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  void showLoading() {
      Get.dialog(
        barrierColor: Colors.transparent,
           Center(
            child: CircularProgressIndicator(color: AppColors.instance.primaryColor,),
          )
      );

  }

  void hideLoading() {
    if (Get.isDialogOpen??false) {
      Get.back();
    }
  }

  void hideKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }


}
