import 'package:t_store_admin_panel/features/shop/screen/brand/all_brands/brand.dart';

import '../features/authentication/screen/forget_password/forget_password_screen.dart';
import '../features/authentication/screen/login/login_screen.dart';
import '../features/authentication/screen/reset_password/reset_password_screen.dart';
import '../features/media/screens/media/media.dart';
import '../features/shop/screen/banner/all_banners/banner.dart';
import '../features/shop/screen/banner/create_banners/create_banner.dart';
import '../features/shop/screen/banner/edit_banners/edit_banner.dart';
import '../features/shop/screen/brand/create_brand/create_brand.dart';
import '../features/shop/screen/brand/edit_brand/edit_brand.dart';
import '../features/shop/screen/category/all_categories/categories.dart';
import '../features/shop/screen/category/create_category/create_categories.dart';
import '../features/shop/screen/category/edit_category/edit_categories.dart';
import '../features/shop/screen/dashboard/dashboard.dart';
import '../features/shop/screen/product/all_products/product.dart';
import '../features/shop/screen/product/create_products/create_product.dart';
import '../features/shop/screen/product/edit_products/edit_product.dart';
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

    /// -- Brands
    GetPage(
        name: TRoutes.brands,
        page: () => BrandScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.createBrands,
        page: () => CreateBrandScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.editBrands,
        page: () => EditBrandScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),

    /// -- Banners
    GetPage(
        name: TRoutes.banners,
        page: () => BannerScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.createBanners,
        page: () => CreateBannerScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.editBanners,
        page: () => EditBannerScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),

    /// -- Product
    GetPage(
        name: TRoutes.products,
        page: () => ProductScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.createProducts,
        page: () =>
            CreateProductScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
    GetPage(
        name: TRoutes.editProducts,
        page: () => EditProductScreen() /*,middlewares: [TRoutesMiddleWare()]*/
        ),
  ];
}
