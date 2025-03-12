import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/brand_desktop.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: BrandDesktopScreen(),
    );
  }
}
