import 'package:t_store_admin_panel/features/shop/screen/dashboard/responsive_screen/dashboard_desktop_screen.dart';
import 'package:t_store_admin_panel/features/shop/screen/dashboard/responsive_screen/dashboard_mobile_screen.dart';
import 'package:t_store_admin_panel/features/shop/screen/dashboard/responsive_screen/dashboard_tablet_screen.dart';

import '../../../utils/constants/path_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: DashboardDesktopScreen(),
      mobile: DashboardMobileScreen(),
      tablet: DashboardTabletScreen(),
    );
  }
}
