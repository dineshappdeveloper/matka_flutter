import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:matka/data/repository/repository.dart';
import 'package:matka/res/route/route_name.dart';
import 'package:matka/utils/appcons.dart';
import 'package:matka/utils/utils.dart';

import '../../../utils/prefrence.dart';

class LoginController extends GetxController{


  var secondsRemaining = 30.obs;
  var canResend = false.obs;



  void startTimer() {
    canResend.value = false;
    secondsRemaining.value = 30;

    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (secondsRemaining.value > 0) {
          secondsRemaining.value--;
        } else {
          timer.cancel();
          canResend.value = true;
        }
      });
    });
  }


  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController lMobileController = TextEditingController();
  TextEditingController lPasswordController = TextEditingController();

  void loginUser(){
    Utils.instance.hideKeyboard();
    String mobile = lMobileController.text.toString().trim();
    String password = lPasswordController.text.toString().trim();

    if(mobile.isEmpty){
      Utils.instance.showSnackbar('Please Enter Mobile Number');
      return;
    }
    if(mobile.length!=10){
      Utils.instance.showSnackbar('Please Enter valid Mobile Number');
      return;
    }
    if(password.isEmpty){
      Utils.instance.showSnackbar('Please Enter Password');
      return;
    }
    if(password.length<4){
      Utils.instance.showSnackbar('Password must be 4 characters');
      return;
    }


    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      'mobile':mobile,
      'password':password
    };
    _repository.loginUser(request).then((model) async {
      if(model.code=='101'){
        await PreferenceManager.instance.saveString(TOKEN, model.data?.token??'');
        await PreferenceManager.instance.saveString(MOBILE, mobile);
        verifyPin();
      }else{
        Utils.instance.hideLoading();
        Utils.instance.showSnackbar(model.message??'');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }

  void verifyPin(){

    final Map<String,dynamic> request = {
      'pin':'1234'
    };
    _repository.verifyPin(request).then((model) async {
      Utils.instance.hideLoading();
      if(model.code=='101'){
        await PreferenceManager.instance.saveString(TOKEN, model.data?.token??'');
        Get.offAllNamed(RouteName.dashboard_screen);
      }else{
        Utils.instance.showSnackbar(model.message??'');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }

  final _repository = Repository();
  String otp = '';

  void registerUser(){
    Utils.instance.hideKeyboard();
    String name = nameController.text.toString().trim();
    String mobile = mobileController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String confirmPassword = confirmPasswordController.text.toString().trim();

    if(name.isEmpty){
      Utils.instance.showSnackbar('Please Enter Name');
      return;
    }
    if(mobile.isEmpty){
      Utils.instance.showSnackbar('Please Enter Mobile Number');
      return;
    }
    if(mobile.length!=10){
      Utils.instance.showSnackbar('Please Enter valid Mobile Number');
      return;
    }
    if(password.isEmpty){
      Utils.instance.showSnackbar('Please Enter Password');
      return;
    }
    if(password.length<4){
      Utils.instance.showSnackbar('Password must be 4 characters');
      return;
    }

    if(password!=confirmPassword){
      Utils.instance.showSnackbar('Password and Confirm Password Not Match');
      return;
    }

    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
   'full_name':name,
    'mobile':mobile,
    'pin':'1234',
    'password':password
    };
    _repository.signupUser(request).then((model){
      Utils.instance.hideLoading();
      if(model.code=='100'){
        Get.toNamed(RouteName.otpScreen,arguments: 1);
      }else{
        Utils.instance.showSnackbar(model.message??'');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }


  void verifyUser(){
    Utils.instance.hideKeyboard();
    String mobile = mobileController.text.toString().trim();
    if(otp.isEmpty){
      Utils.instance.showSnackbar('Please Enter OTP');
      return;
    }
    if(otp.length!=4){
      Utils.instance.showSnackbar('Please Enter valid OTP');
      return;
    }


    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      'mobile':mobile,
      'otp':otp
    };
    _repository.verifyUser(request).then((model) async {
      Utils.instance.hideLoading();
      if(model.code=='100'){
        await PreferenceManager.instance.saveString(TOKEN, model.data?.token??'');
        Get.offAllNamed(RouteName.dashboard_screen);
      }else{
        Utils.instance.showSnackbar(model.message??'');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }

  void resendOTP(){
    Utils.instance.hideKeyboard();
    String mobile = mobileController.text.toString().trim();

    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      'mobile':mobile
    };
    _repository.resendOTP(request).then((model) async {
      startTimer();
      Utils.instance.hideLoading();
      if(model.status=='100'){
        Utils.instance.showSnackbar(model.message??'');
      }else{
        Utils.instance.showSnackbar(model.message??'');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }

  void forgotPassword(){
    Utils.instance.hideKeyboard();
    String mobile = mobileController.text.toString().trim();

    if(mobile.isEmpty){
      Utils.instance.showSnackbar('Please Enter Mobile Number');
      return;
    }
    if(mobile.length!=10){
      Utils.instance.showSnackbar('Please Enter valid Mobile Number');
      return;
    }

    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      'mobile':mobile
    };
    _repository.forgotPassword(request).then((model) async {
      Utils.instance.hideLoading();
      if(model.code=='100'){
        Get.toNamed(RouteName.otpScreen,arguments: 2);
      }else{
        Utils.instance.showSnackbar(model.message??'');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }


  void verifyForgotOTP(){
    Utils.instance.hideKeyboard();
    String mobile = mobileController.text.toString().trim();
    if(otp.isEmpty){
      Utils.instance.showSnackbar('Please Enter OTP');
      return;
    }
    if(otp.length!=4){
      Utils.instance.showSnackbar('Please Enter valid OTP');
      return;
    }


    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      'mobile':mobile,
      'otp':otp
    };
    _repository.verifyOtpForgotPassword(request).then((model) async {
      Utils.instance.hideLoading();
      if(model.code=='100'){
        await PreferenceManager.instance.saveString(TOKEN, model.data?.token??'');
        await PreferenceManager.instance.saveString(MOBILE, mobile);
        Get.offAllNamed(RouteName.createPasswordScreen);
      }else{
        Utils.instance.showSnackbar(model.message??'');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }


}