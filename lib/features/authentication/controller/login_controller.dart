import 'package:get_storage/get_storage.dart';
import 'package:t_store_admin_panel/features/authentication/controller/user_controller.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

import '../../../data/repository/authendication/authendication_repository.dart';
import '../../../data/repository/user/user_repository.dart';
import '../../../utils/constants/path_provider.dart';
import '../model/user_model.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  ///Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final authRepo = AuthendicationRepository.instance;

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? '';
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      ///Form Validation
      if (!loginFormKey.currentState!.validate()) return;

      ///start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);

      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      Get.put(AuthendicationRepository());

      ///Register user in the firebase
      await authRepo.loginWithEmailAndPassword(email.text, password.text);

      final user = await UserController.instance.fetchUserDetails();
      TFullScreenLoader.stopLoading();
      if (user.appRole != AppRole.admin) {
        authRepo.logout();
        TLoaders.errorSnackBar(
            title: "Not Authorized",
            message:
                " You are not Authorized  or do have access, Contact Admin ");
      } else {
        authRepo.screenRedirect();
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> registerAdmin() async {
    try {
      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      ///Form Validation
      // if (!loginFormKey.currentState!.validate()) return;

      ///start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);
      Get.put(AuthendicationRepository());

      ///Register user in the firebase
      final userCredential = await AuthendicationRepository.instance
          .registerWithEmailAndPassword(
              TTexts.adminEmail, TTexts.adminPassword);

      ///Save authendication data in firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: "Karthick",
          lastName: "Dinesh",
          phoneNumber: "+917094930770",
          appRole: AppRole.user,
          email: TTexts.adminEmail,
          password: TTexts.password,
          createdAt: DateTime.now());

      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(newUser);
      TLoaders.successSnackBar(
          title: "Success", message: "Account created successfully");

      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
