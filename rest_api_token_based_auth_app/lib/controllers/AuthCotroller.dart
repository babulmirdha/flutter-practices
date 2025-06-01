

import 'package:get/get.dart';

import '../models/user.dart';
import '../pages/user_info_page.dart';
import '../repos/auth_repo.dart';


class AuthController extends GetxController {
  final AuthRepo _authRepo = AuthRepo();

  var isLoading = false.obs;
  var token = ''.obs;
  var user = Rxn<User>();

  Future<void> signup(Map<String, dynamic> body) async {
    isLoading.value = true;
    try {
      await _authRepo.signup(body);
      Get.snackbar("Success", "Account created");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      token.value = await _authRepo.login({'email': email, 'password': password});

      await fetchUser(); // fetch user info using the token

      // ✅ Navigate to the User Info page
      Get.off(() => UserInfoPage());

      Get.snackbar("Success", "Logged in");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> fetchUser() async {
    try {
      final fetchedUser = await _authRepo.getMe(token.value);
      user.value = fetchedUser;
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user");
    }
  }
}
