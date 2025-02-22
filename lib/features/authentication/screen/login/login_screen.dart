import 'package:t_store_admin_panel/features/authentication/screen/login/responsive_screens/login_desktop_tablet.dart';
import 'package:t_store_admin_panel/features/authentication/screen/login/responsive_screens/login_mobile.dart';

import '../../../../utils/constants/path_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      useLayout: false,
      desktop: LoginDesktopTabletScreen(),
      mobile: LoginMobile(),
    );
  }
}
