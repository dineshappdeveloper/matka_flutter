

class AppUrl {
  AppUrl._();

  static final AppUrl instance = AppUrl._();

  factory AppUrl() {
    return instance;
  }

  String baseUrl = 'https://development.smapidev.co.in/api/Api';
  String get signupApi => '$baseUrl/signup';
  String get verifyUserApi => '$baseUrl/verify_user';
  String get resendOTPApi => '$baseUrl/resend_otp';
  String get loginApi => '$baseUrl/login';
  String get loginPinApi => '$baseUrl/login_pin';
  String get forgotPasswordApi => '$baseUrl/forgot_password';
  String get verifyOTPForgotPasswordApi => '$baseUrl/verify_otp';
  String get createPasswordApi => '$baseUrl/forgot_password_verify';
  String get getProfileApi => '$baseUrl/get_user_details';
  String get gameListApi => '$baseUrl/main_game_list';
  String get appDetailsApi => '$baseUrl/app_details';

}
