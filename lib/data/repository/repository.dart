
import 'package:matka/res/screens/dashboard/GameModel.dart';
import 'package:matka/res/screens/dashboard/home_model.dart';
import 'package:matka/res/screens/dashboard/profile_model.dart';
import 'package:matka/res/screens/register/signupmodel.dart';
import 'package:matka/res/screens/register/verifyusermodel.dart';
import '../app_urls/app_url.dart';
import '../network/network_api_services.dart';

class Repository{

  final _apiService = NetworkApiServices();

  Future<VerifyUserModel> loginUser(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.loginApi);
    print(resposne);
    return VerifyUserModel.fromJson(resposne);
  }
  Future<VerifyUserModel> verifyPin(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.loginPinApi);
    print(resposne);
    return VerifyUserModel.fromJson(resposne);
  }

  Future<SignupModel> signupUser(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.signupApi);
    print(resposne);
    return SignupModel.fromJson(resposne);
  }

  Future<SignupModel> resendOTP(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.resendOTPApi);
    print(resposne);
    return SignupModel.fromJson(resposne);
  }
  Future<SignupModel> forgotPassword(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.forgotPasswordApi);
    print(resposne);
    return SignupModel.fromJson(resposne);
  }

  Future<SignupModel> changePassword(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.createPasswordApi);
    print(resposne);
    return SignupModel.fromJson(resposne);
  }

  Future<VerifyUserModel> verifyOtpForgotPassword(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.verifyOTPForgotPasswordApi);
    print(resposne);
    return VerifyUserModel.fromJson(resposne);
  }

  Future<VerifyUserModel> verifyUser(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.verifyUserApi);
    print(resposne);
    return VerifyUserModel.fromJson(resposne);
  }

  Future<AppDetailsModel> getAppDetails() async {
    dynamic response  = await _apiService.getApi(AppUrl.instance.appDetailsApi);
    print(response);
    return AppDetailsModel.fromJson(response);
  }

  Future<ProfileModel> getProfile() async {
    dynamic response  = await _apiService.getApi(AppUrl.instance.getProfileApi);
    print(response);
    return ProfileModel.fromJson(response);
  }

  Future<GameModel> getGame() async {
    dynamic response  = await _apiService.getApi(AppUrl.instance.gameListApi);
    print(response);
    return GameModel.fromJson(response);
  }
  //
  // Future<dynamic> addToCart(var data) async {
  //   dynamic response  = await _apiService.postApi(data,AppUrl.instance.cartApi);
  //   print(response);
  //   return response;
  // }
  //
  // Future<CartModel> getCart() async {
  //   dynamic response  = await _apiService.getApi(AppUrl.instance.cartApi);
  //   print(response);
  //   return CartModel.fromJson(response);
  // }
  // Future<dynamic> checkout(var data) async {
  //   dynamic response  = await _apiService.postApi(data,AppUrl.instance.checkoutApi);
  //   print(response);
  //   return response;
  // }
  //
  // Future<OrderModel> getOrderHistory() async {
  //   dynamic response  = await _apiService.getApi(AppUrl.instance.orderHistoryApi);
  //   print(response);
  //   return OrderModel.fromJson(response);
  // }

}