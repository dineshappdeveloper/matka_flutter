

import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import '../../../main.dart';
import '../../../utils/utils.dart';
import '../../assets/image_assets.dart';
import '../../route/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor:
      Colors.black, // navigation bar color
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light, // status bar color
    ));
    Timer(const Duration(seconds: 5), () async {
      Utils.instance.getToken().then((token){
       token!=null? Get.offAllNamed(RouteName.dashboard_screen):Get.offAllNamed(RouteName.registerScreen);
      });
    });
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(child: Image.asset(Assets.instance.imagesLogo).paddingSymmetric(horizontal: rwidth*.1),)
          ,
        )
    );
  }
}
