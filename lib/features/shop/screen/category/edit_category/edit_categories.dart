import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/edit_categories_desktop.dart';

class EditCategoriesScreen extends StatelessWidget {
  const EditCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: EditCategoriesDesktopScreen(),
    );
  }
}
