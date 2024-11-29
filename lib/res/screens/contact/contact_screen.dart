import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matka/main.dart';
import 'package:matka/res/colors/app_color.dart';
import 'package:matka/res/components/app_style.dart';
import 'package:matka/res/components/custom_text.dart';
import 'package:matka/res/screens/dashboard/dashboard_controller.dart';
import 'package:matka/utils/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../assets/image_assets.dart';
import '../../components/svg.dart';

class ContactScren extends StatefulWidget {
  const ContactScren({super.key});

  @override
  State<ContactScren> createState() => _ContactScrenState();
}

class _ContactScrenState extends State<ContactScren> {
  late DashboardController _controller;

  @override
  void initState() {
    _controller = Get.put(DashboardController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.instance.primaryColor,
          title: CustomText(
            'Contact Us',
            style: AppStyles.instance.h1.copyWith(
                color: AppColors.instance.whitColor,
                fontWeight: FontWeight.w900,
                fontSize: 25),
          ),
        ),
        body: SizedBox(
          width: rwidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              context.mheight(.03),
              GestureDetector(
                onTap: () {
                  makePhoneCall(_controller.appDetailsModel.value.data
                          ?.contactDetails?.mobileNo1 ??
                      '');
                },
                child: SizedBox(
                  width: rwidth * .5,
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                              child: SvgImage(
                                  icon: Assets.instance.imagesCall,
                                  height: 35,
                                  width: 35)),
                        ),
                        CustomText(
                          'Call Now',
                          style: AppStyles.instance.h3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              context.mheight(0.02),
              GestureDetector(
                onTap: () {
                  openWhatsApp(_controller.appDetailsModel.value.data
                          ?.contactDetails?.whatsappNo ??
                      '');
                },
                child: SizedBox(
                  width: rwidth * .5,
                  child: Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                              child: SvgImage(
                                  icon: Assets.instance.whatsapp,
                                  height: 35,
                                  width: 35)),
                        ),
                        CustomText(
                          'Whatsapp',
                          style: AppStyles.instance.h3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              context.mheight(0.02),
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse(_controller.appDetailsModel.value
                          .data?.contactDetails?.telegramNo ??
                      '');
                  await launchUrl(url);
                },
                child: SizedBox(
                  width: rwidth * .5,
                  child: Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                              child: SvgImage(
                                  icon: Assets.instance.telegram,
                                  height: 35,
                                  width: 35)),
                        ),
                        CustomText(
                          'Telegram',
                          style: AppStyles.instance.h3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              context.mheight(0.05),
            ],
          ).paddingSymmetric(horizontal: rwidth * .04),
        ),
      ),
    );
  }

  Future<void> openWhatsApp(String phone) async {
    final String whatsappUrl = "https://wa.me/$phone";

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl),
          mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $whatsappUrl";
    }
  }

  Future<void> makePhoneCall(String number) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: number);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }
}
