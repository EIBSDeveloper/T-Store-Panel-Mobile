import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/create_brand_desktop.dart';

class CreateBrandScreen extends StatelessWidget {
  const CreateBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateBrandDesktopScreen(),
    );
  }
}
