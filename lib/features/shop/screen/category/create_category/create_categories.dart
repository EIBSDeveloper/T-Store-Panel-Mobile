import 'package:t_store_admin_panel/features/shop/screen/category/create_category/responsive_screen/create_categories_desktop.dart';

import '../../../../../utils/constants/path_provider.dart';

class CreateCategoriesScreen extends StatelessWidget {
  const CreateCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateCategoryDesktopScreen(),
    );
  }
}
