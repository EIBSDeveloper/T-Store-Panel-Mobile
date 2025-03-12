import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/edit_banner_desktop.dart';

class EditBannerScreen extends StatelessWidget {
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: EditBannerDesktopScreen(),
    );
  }
}
