import 'package:t_store_admin_panel/features/authentication/screen/forget_password/forget_password_screen.dart';
import 'package:t_store_admin_panel/features/authentication/screen/reset_password/reset_password_screen.dart';
import 'package:t_store_admin_panel/features/shop/screen/dashboard.dart';

import '../features/authentication/screen/login/login_screen.dart';
import '../utils/constants/path_provider.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: TRoutes.dashboard, page: () => DashboardScreen()),
  ];
}
