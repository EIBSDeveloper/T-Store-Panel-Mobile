import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/create_banner_desktop.dart';

class CreateBannerScreen extends StatelessWidget {
  const CreateBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateBannerDesktopScreen(),
    );
  }
}
