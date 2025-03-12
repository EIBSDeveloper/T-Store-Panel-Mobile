import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/products_desktop.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: ProductDesktopScreen(),
    );
  }
}
