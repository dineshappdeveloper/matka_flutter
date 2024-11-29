import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:matka/res/screens/login/login_screen.dart';

import '../../../data/repository/repository.dart';
import '../../../utils/appcons.dart';
import '../../../utils/prefrence.dart';
import '../../../utils/utils.dart';

class ChangePasswordController extends GetxController{
  final _repository = Repository();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  Future<void> changePassword() async {
    String password = passwordController.text.toString().trim();
    String confirmPassword = confirmPasswordController.text.toString().trim();

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

  String? mobile = await PreferenceManager.instance.getString(MOBILE);

    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      'mobile':mobile,
      'password':password
    };
    _repository.changePassword(request).then((model) async {
      Utils.instance.hideLoading();
      if(model.code=='100'){
        await PreferenceManager.instance.clear();
        Get.offAll(const LoginScreen());
      }else{
        Utils.instance.showSnackbar(model.message??'');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }

}