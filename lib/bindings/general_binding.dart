import '../data/repository/authendication/authendication_repository.dart';
import '../features/authentication/controller/user_controller.dart';
import '../utils/constants/path_provider.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => AuthendicationRepository());
  }
}
