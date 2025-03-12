import 'package:t_store_admin_panel/features/shop/screen/category/all_categories/responsive_screen/categories_desktop.dart';

import '../../../../../utils/constants/path_provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CategoryDesktopScreen(),
    );
  }
}
