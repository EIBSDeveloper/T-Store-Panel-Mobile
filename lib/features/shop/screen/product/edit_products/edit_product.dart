import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/edit_product_desktop.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: EditProductDesktopScreen(),
    );
  }
}
