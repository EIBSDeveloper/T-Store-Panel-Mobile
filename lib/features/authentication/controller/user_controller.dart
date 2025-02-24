import 'package:get/get.dart';
import 'package:t_store_admin_panel/data/repository/user/user_repository.dart';
import 'package:t_store_admin_panel/features/authentication/model/user_model.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<UserModel> fechUserDetails() async {
    try {
      final user = userRepository.fetchAdminDetails();
      return user;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Something went wrong!", message: e.toString());

      return UserModel.empty();
    }
  }
}
