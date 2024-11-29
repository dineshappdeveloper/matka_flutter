
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:matka/res/route/route_name.dart';
import 'package:matka/res/screens/contact/contact_screen.dart';
import 'package:matka/res/screens/createpassword/createpassword_screen.dart';
import 'package:matka/res/screens/dashboard/dashboard_screen.dart';
import 'package:matka/res/screens/forgotpassword/forgot_password_screen.dart';
import 'package:matka/res/screens/otp/otp_screen.dart';
import 'package:matka/res/screens/register/register_screen.dart';
import 'package:matka/res/screens/update_password/update_password_screen.dart';
import 'package:matka/res/screens/webview/webview_screen.dart';

import '../screens/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';



class Routes{
  static appRoutes() => [
    GetPage(name: RouteName.splash_screen, page: () =>   const SplashScreen(),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.registerScreen, page: () =>   const RegisterScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.login_screen, page: () =>   const LoginScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.forgotPassword, page: () =>   const ForgotPasswordScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.otpScreen, page: () =>   const OTPScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.createPasswordScreen, page: () =>   const CreatePasswordScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.dashboard_screen, page: () =>   const DashboardScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    //
    GetPage(name: RouteName.webviewScreen, page: () =>   const WebViewScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.updatePasswordScreen, page: () =>   const UpdatePasswordScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.contactScreen, page: () =>   const ContactScren(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    // GetPage(name: RouteName.orderHistoryScreen, page: () =>   const OrderHistoryScreen(),
    //     transitionDuration: const Duration(milliseconds: 200),
    //     transition: Transition.rightToLeft
    // ),
    // GetPage(name: RouteName.orderHistoryDetailsScreen, page: () =>   const OrderHistoryDetailsScreen(),
    //     transitionDuration: const Duration(milliseconds: 200),
    //     transition: Transition.rightToLeft
    // ),
  ];
  }