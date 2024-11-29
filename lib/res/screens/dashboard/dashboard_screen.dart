import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:matka/data/response/status.dart';
import 'package:matka/main.dart';
import 'package:matka/res/colors/app_color.dart';
import 'package:matka/res/components/app_style.dart';
import 'package:matka/res/components/custom_text.dart';
import 'package:matka/res/components/shimmers/order_shimmer.dart';
import 'package:matka/res/components/svg.dart';
import 'package:matka/res/screens/dashboard/dashboard_controller.dart';
import 'package:matka/utils/sizes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/prefrence.dart';
import '../../assets/image_assets.dart';
import '../../components/cachedNetworkImage.dart';
import '../../route/route_name.dart';
import '../splash/splash_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardController _controller;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          AppColors.instance.primaryColor, // navigation bar color
      statusBarColor: AppColors.instance.primaryColor,
      statusBarIconBrightness: Brightness.light, // status bar color
    ));
    _controller = Get.put(DashboardController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            'Kalyan Bazar',
            style: AppStyles.instance.h1
                .copyWith(color: AppColors.instance.whitColor),
          ),
          centerTitle: true,
          backgroundColor: AppColors.instance.primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          leading: GestureDetector(
            onTap: () => _controller.toggleDrawer(),
            child: Icon(
              Icons.menu,
              size: 34,
              color: AppColors.instance.whitColor,
            ),
          ),
        ),
        key: _controller.scaffoldKey,
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: rwidth,
                color: AppColors.instance.primaryColor,
                padding: EdgeInsets.only(
                    top: rheight * .03,
                    left: rwidth * .1,
                    bottom: rheight * .03),
                child: _navHeaderSection(),
              ),
              10.height,
              _navItems(
                  title: 'Home',
                  img: CupertinoIcons.home,
                  onClick: () {
                    _controller.toggleDrawer();
                  }),
              15.height,
              _navItems(
                  title: 'Contact Us',
                  img: Icons.support_agent,
                  onClick: () async {
                    _controller.toggleDrawer();
                    Get.toNamed(RouteName.contactScreen);
                  }),
              15.height,
              _navItems(
                  title: 'Update Password',
                  img: Icons.lock_outline,
                  onClick: () async {
                    _controller.toggleDrawer();
                    Get.toNamed(RouteName.updatePasswordScreen);
                  }),
              15.height,
              _navItems(
                  title: 'Share With Others',
                  img: Icons.share,
                  onClick: () async {
                    _controller.toggleDrawer();
                    Share.share(
                        'Check out this amazing app! ${_controller.appDetailsModel.value.data?.appLink ?? ''}');
                  }),
              15.height,
              _navItems(
                  title: 'Privacy Policy',
                  img: Icons.privacy_tip_outlined,
                  onClick: () async {
                    _controller.toggleDrawer();
                    final Uri url = Uri.parse(
                        'http://development.smapidev.co.in/privacy_policy');
                    await launchUrl(url);
                  }),
              15.height,
              _navItems(
                  title: 'Terms & Conditions',
                  img: Icons.info_outline,
                  onClick: () async {
                    _controller.toggleDrawer();
                    final Uri url = Uri.parse(
                        'http://development.smapidev.co.in/terms_and_conditions');
                    await launchUrl(url);
                  }),
              15.height,
              _navItems(
                  title: 'Logout',
                  img: Icons.logout_outlined,
                  onClick: () async {
                    _controller.toggleDrawer();
                    _showCupertinoDialog(context);
                  }),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.mheight(.01),
            Obx(() {
              switch (_controller.rxAppStatus.value) {
                case Status.LOADING:
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[200]!,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.withOpacity(0.3)),
                    ),
                  );
                case Status.COMPLETE:
                  final list = _controller.imgList;
                  if (list.isNotEmpty) {
                    return _slider(list);
                  } else {
                    return 5.height;
                  }

                case Status.ERROR:
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[200]!,
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.withOpacity(0.3)),
                    ),
                  );
              }
            }),
            context.mheight(.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    makePhoneCall(_controller.appDetailsModel.value.data
                            ?.contactDetails?.mobileNo1 ??
                        '');
                  },
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 3,
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                          child: SvgImage(
                              icon: Assets.instance.imagesCall,
                              height: 40,
                              width: 40)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    openWhatsApp(_controller.appDetailsModel.value.data
                            ?.contactDetails?.whatsappNo ??
                        '');
                  },
                  child: Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 3,
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                          child: SvgImage(
                              icon: Assets.instance.whatsapp,
                              height: 40,
                              width: 40)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(_controller.appDetailsModel.value
                            .data?.contactDetails?.telegramNo ??
                        '');
                    await launchUrl(url);
                  },
                  child: Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 3,
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                          child: SvgImage(
                              icon: Assets.instance.telegram,
                              height: 40,
                              width: 40)),
                    ),
                  ),
                )
              ],
            ),
            context.mheight(.005),
           Obx((){
             final playlink = _controller.appDetailsModel.value.data?.playLink ?? '';
             if(playlink.isNotEmpty){
               return GestureDetector(
                   onTap: () async {
                     final Uri url = Uri.parse(playlink);
                     await launchUrl(url);
                   },
                   child: Image.asset(Assets.instance.adImage));
             }
             else{
               return 1.height;
             }
           }),

            context.mheight(.005),
            Expanded(
              child: Obx(() {
                switch (_controller.rxStatus.value) {
                  case Status.LOADING:
                    return ListView.builder(
                        itemCount: 10,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const OrderShimmer();
                        });
                  case Status.COMPLETE:
                    final list = _controller.gameModel.value.data ?? [];
                    if (list.isNotEmpty) {
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final model = list[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.webviewScreen,
                                    arguments: model.chartUrl ?? '');
                              },
                              child: Card(
                                elevation: 6,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 2,
                                          color:
                                              AppColors.instance.primaryColor)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomText(
                                            'Open ${model.openTime}',
                                            style: AppStyles.instance.h3
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          const Spacer(),
                                          CustomText(
                                            'Close ${model.closeTime}',
                                            style: AppStyles.instance.h3
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      context.mheight(.01),
                                      CustomText(
                                        '${model.name}',
                                        style: AppStyles.instance.h3.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      context.mheight(.005),
                                      CustomText(
                                        '${model.result}',
                                        style: AppStyles.instance.h3.copyWith(
                                            color: Colors.blue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: 10, vertical: 10),
                                ),
                              ).marginOnly(bottom: 7),
                            );
                          });
                    } else {
                      return Center(
                        child: CustomText(
                          'Game Not found',
                          style: AppStyles.instance.h3,
                        ),
                      );
                    }

                  case Status.ERROR:
                    return Center(
                      child: CustomText(
                        'Game Not found',
                        style: AppStyles.instance.h3,
                      ),
                    );
                }
              }),
            )
          ],
        ).paddingSymmetric(horizontal: rwidth * .04),
      ),
    );
  }

  Widget _navHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: rwidth * .23,
          width: rwidth * .23,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.instance.whitColor),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(rwidth * .1),
              child: CachedNetwork(
                imgUrl:
                    'https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png',
                width: rwidth * .13,
                shimmerRadius: true,
              )),
        ),
        context.mheight(0.015),
        Obx(() {
          final data = _controller.profileModel.value.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                data?.username ?? 'Guest User',
                style: AppStyles.instance.h3.copyWith(
                    color: AppColors.instance.whitColor,
                    fontWeight: FontWeight.w600),
              ),
              3.height,
              CustomText(
                '+91-${data?.mobile}',
                style: AppStyles.instance.h4.copyWith(
                    color: AppColors.instance.whitColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          );
        })
      ],
    );
  }

  Widget _navItems(
      {required String title,
      required IconData img,
      required VoidCallback onClick}) {
    return InkWell(
      onTap: () => onClick(),
      child: Row(
        children: [
          Icon(img),
          15.width,
          CustomText(
            title,
            style: AppStyles.instance.h6.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.instance.black.withOpacity(.7),
            ),
          )
        ],
      ).paddingSymmetric(vertical: 4, horizontal: 15),
    );
  }

  void _showCupertinoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Log Out',style: AppStyles.instance.h3.copyWith(color: Colors.black),),
          content: Text('Are you sure you want to log out?',style: AppStyles.instance.h4.copyWith(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',style: AppStyles.instance.h4.copyWith(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Log Out',style: AppStyles.instance.h4.copyWith(color: Colors.black)),
              onPressed: () async {
                await PreferenceManager.instance.clear();
                 Get.offAll(const SplashScreen());
              },
            ),
          ],
        );
      },
    );
  }

  /*void _showCupertinoDialog(BuildContext context) {


    // showCupertinoDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return CupertinoAlertDialog(
    //       title: const Text('Logout'),
    //       content: const Text('Are you sure want to Logout?'),
    //       actions: [
    //         CupertinoDialogAction(
    //           child: const Text('No'),
    //           onPressed: () {
    //             Get.back(); // Return "No"
    //           },
    //         ),
    //         CupertinoDialogAction(
    //           child: const Text('Yes'),
    //           onPressed: () async {
    //             await PreferenceManager.instance.clear();
    //             Get.offAll(const SplashScreen());
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
  }*/

  Widget _slider(List<String> bannerlist) {
    return Column(
      children: [
        CarouselSlider(
            items: bannerlist
                .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: CachedNetwork(
                        imgUrl: item,
                        width: rwidth,
                        height: rheight * .2,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: rheight * .23,
              viewportFraction: 0.85,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              onPageChanged: (pos, reason) {
                _controller.selectedSlider.value = pos;
              },
              scrollDirection: Axis.horizontal,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerlist.asMap().entries.map((entry) {
            return Obx(() => Container(
                  width: _controller.selectedSlider.value != entry.key ? 8 : 15,
                  height: 8,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: _controller.selectedSlider.value == entry.key
                          ? AppColors.instance.primaryColor
                          : Colors.grey.shade400),
                ));
          }).toList(),
        ),
      ],
    );
  }

  Future<void> openWhatsApp(String phone) async {
    final String whatsappUrl = "https://wa.me/$phone";

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl),
          mode: LaunchMode.externalApplication);
    } else {
      const SnackBar(
        content: Text("WhatsApp is not installed. Please install WhatsApp."),
        duration: Duration(seconds: 3),
      );
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
