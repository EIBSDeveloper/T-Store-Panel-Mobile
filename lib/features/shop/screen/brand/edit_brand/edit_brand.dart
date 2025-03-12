import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/edit_brand_desktop.dart';

class EditBrandScreen extends StatelessWidget {
  const EditBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: EditBrandDesktopScreen(),
    );
  }
}
