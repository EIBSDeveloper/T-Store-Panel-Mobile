import 'package:t_store_admin_panel/features/shop/screen/product/create_products/responsive_screen/create_product_mobile.dart';

import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/create_product_desktop.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateProductDesktopScreen(),
      mobile: CreateProductMobileScreen(),
    );
  }
}
