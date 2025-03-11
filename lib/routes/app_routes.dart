import '../features/authentication/screen/forget_password/forget_password_screen.dart';
import '../features/authentication/screen/login/login_screen.dart';
import '../features/authentication/screen/reset_password/reset_password_screen.dart';
import '../features/media/screens/media/media.dart';
import '../features/shop/screen/category/all_categories/categories.dart';
import '../features/shop/screen/category/create_category/create_categories.dart';
import '../features/shop/screen/category/edit_category/edit_categories.dart';
import '../features/shop/screen/dashboard/dashboard.dart';
import '../utils/constants/path_provider.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(
        name: TRoutes.dashboard,
        page: () => DashboardScreen() /*, middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.media,
        page: () => MediaScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),

    /// -- Categories
    GetPage(
        name: TRoutes.categories,
        page: () => CategoriesScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.createCategories,
        page: () =>
            CreateCategoriesScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.editCategories,
        page: () =>
            EditCategoriesScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
  ];
}
