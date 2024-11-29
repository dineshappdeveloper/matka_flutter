import 'dart:ui';

class AppColors{
  AppColors._();


  static final AppColors instance = AppColors._();

  // Factory constructor to return the same instance
  factory AppColors() {
    return instance;
  }

   Color primaryColor = const Color(0xff100349);
   Color secondryColor = const Color(0xffECF0E7);
   Color yellowcolor = const Color(0xffF8B50F);
   Color darkblue = const Color(0xff063584);
   Color whitColor = const Color(0xffFFFFFF);
   Color black = const Color(0xff1C1C1C);
   Color redcolor = const Color(0xffFF1723);
   Color light_black = const Color(0xc21c1c1c);
   Color gary = const Color(0xffbababa);
   Color garytextcolor = const Color(0xff898A8D);
   Color light_gray = const Color(0x10D9D9D9);
   Color light_gray1 = const Color(0x5EDFE7D2);
   Color light_gray2 = const Color(0xffF5F5F5);
   Color light_gray3 = const Color(0xedd5e7e7);
   Color graycolor = const Color(0xff7C7C7C);
   Color graycolor1 = const Color(0xffFAFAFA);
   Color graycolor2 = const Color(0xffD1D1D1);
   Color graycolor3 = const Color(0xffF5F5F5);


   Color borderColor = const Color(0xFFEBEBEB);
   Color textlight = const Color(0xFFACACAC);
   Color thingray = const Color(0xFFB1B1B1);

  get lightprimary => const Color(0x62100349);


}