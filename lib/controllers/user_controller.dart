import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:palm/services/app_service.dart';
import 'package:palm/models/user.dart';
import 'package:palm/services/user_service.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();
  final user = User().obs;
  final isLoading = false.obs;

  void loginUser(String username, String password) async {
    isLoading.value = true;
    try {
      // Call API
      final User userResponse =
          await _userService.loginUser(username, password);
      user.value = userResponse;

      // Save login
      AppService.instance.saveLogin();

      // Navigate to main page
      GoRouter.of(AppService.instance.navigatorKey.currentContext!)
          .replace('/main');
    } catch (e) {
      // TODO :: Handle the error
    } finally {
      isLoading.value = false;
    }
  }
}
