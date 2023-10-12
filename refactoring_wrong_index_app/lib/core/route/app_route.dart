import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/kyc/kyc_screen.dart';

class AppRoute {
  static const String signUpScreen = "/sign_up_screen";
  static const String kycScreen = "/kyc_screen";

  static List<GetPage> routes = [
    GetPage(name: kycScreen, page: ()=>const KYCScreen()),
  ];
}