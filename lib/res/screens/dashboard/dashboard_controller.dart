

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matka/data/repository/repository.dart';
import 'package:matka/res/screens/dashboard/GameModel.dart';
import 'package:matka/res/screens/dashboard/home_model.dart';
import 'package:matka/res/screens/dashboard/profile_model.dart';


import '../../../data/response/status.dart';
import '../../../utils/appcons.dart';
import '../../../utils/prefrence.dart';


class DashboardController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt selectedSlider = 0.obs;

  void toggleDrawer() {
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      scaffoldKey.currentState?.openEndDrawer();
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }

  final _repository = Repository();
  final rxStatus = Status.LOADING.obs;
  final rxAppStatus = Status.LOADING.obs;
  final appDetailsModel = AppDetailsModel().obs;
  final profileModel = ProfileModel().obs;

  @override
  void onInit() {
    getGame();
    getAppDetails();
    getProfile();
    super.onInit();
  }

  final RxList<String> imgList = <String>[].obs;

  void getAppDetails() {
    rxAppStatus.value = Status.LOADING;
    _repository.getAppDetails().then((model) async {
      appDetailsModel.value = model;
      rxAppStatus.value = Status.COMPLETE;
      for(int i=0;i<model.data!.banner!.length;i++){
        imgList.add(model.data!.banner![i].image!);
      }
    }).catchError((error) {
      rxAppStatus.value = Status.ERROR;
    });
  }

  void getProfile() {
    _repository.getProfile().then((model) async {
      profileModel.value = model;
      await PreferenceManager.instance.saveString(MOBILE, model.data?.mobile??'');
    }).catchError((error) {});
  }

  final gameModel = GameModel().obs;

  void getGame() {
    rxStatus.value = Status.LOADING;
    _repository.getGame().then((model) {
      gameModel.value = model;
      rxStatus.value = Status.COMPLETE;
    }).catchError((error) {
      rxStatus.value = Status.ERROR;
    });
  }


}



