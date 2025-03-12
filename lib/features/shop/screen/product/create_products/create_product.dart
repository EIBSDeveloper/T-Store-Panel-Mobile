import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/create_product_desktop.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateProductDesktopScreen(),
    );
  }
}
