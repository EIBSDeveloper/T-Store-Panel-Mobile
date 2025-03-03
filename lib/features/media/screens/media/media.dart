import 'package:t_store_admin_panel/features/media/screens/media/responsive_screen/media_desktop.dart';
import 'package:t_store_admin_panel/features/media/screens/media/responsive_screen/media_mobile.dart';
import 'package:t_store_admin_panel/features/media/screens/media/responsive_screen/media_tablet.dart';

import '../../../../utils/constants/path_provider.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
        desktop: MediaDesktopScreen(),
        tablet: MediaTabletScreen(),
        mobile: MediaMobileScreen());
  }
}
