import '../../../../../utils/constants/path_provider.dart';
import 'responsive_screen/banners_desktop.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: BannerDesktopScreen(),
    );
  }
}
