import 'package:get/get.dart';
import 'package:t_store_admin_panel/data/repository/user/user_repository.dart';
import 'package:t_store_admin_panel/features/authentication/model/user_model.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  var isLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  Future<UserModel> fetchUserDetails() async {
    try {
      isLoading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      isLoading.value = false;
      return user;
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(
          title: "Something went wrong!", message: e.toString());

      return UserModel.empty();
    }
  }
}
