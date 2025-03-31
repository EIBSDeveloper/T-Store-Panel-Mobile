class TRoutes {
  static const login = '/login';
  static const forgetPassword = '/forget-Password';
  static const resetPassword = '/reset-Password';
  static const dashboard = '/dashboard';
  static const media = '/media';

  /// - Categories
  static const categories = '/categories';
  static const createCategories = '/createCategories';
  static const editCategories = '/editCategories';

  /// - Brands
  static const brands = '/brands';
  static const createBrands = '/createBrand';
  static const editBrands = '/editBrand';

  /// - Banners
  static const banners = '/banners';
  static const createBanners = '/createBanners';
  static const editBanners = '/editBanners';

  /// - Products
  static const products = '/products';
  static const createProducts = '/createProducts';
  static const editProducts = '/editProducts';

  /// - Customer
  static const customer = '/customer';
  static const customerDetails = '/customerDetails';
  static const createCustomer = '/createCustomer';

  static List sidebarMenuItems = [
    dashboard,
    media,
    categories,
    brands,
    banners,
    products,
    customer
  ];
}
