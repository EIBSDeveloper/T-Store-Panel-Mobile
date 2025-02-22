import 'package:get_storage/get_storage.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/popups/full_screen_loader.dart';

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

  Future<void> emailAndPasswordSignIn() async {}

  Future<void> registerAdmin() async {
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
        .registerWithEmailAndPassword(TTexts.adminEmail, TTexts.password);

    ///Save authendication data in firebase firestore
    final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: "Karthick",
        lastName: "Dinesh",
        phoneNumber: "+917094930770",
        appRole: AppRole.admin,
        email: TTexts.adminEmail,
        password: TTexts.password,
        createdAt: DateTime.now());

    final userRepository = Get.put(UserRepository());
    await userRepository.createUser(newUser);

    TFullScreenLoader.stopLoading();
  }
}
