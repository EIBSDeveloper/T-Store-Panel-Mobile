import 'package:t_store_admin_panel/features/authentication/screen/forget_password/responsive_screen/forget_password_desktop_tablet.dart';
import 'package:t_store_admin_panel/features/authentication/screen/forget_password/responsive_screen/forget_password_mobile.dart';

import '../../../../utils/constants/path_provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      useLayout: false,
      desktop: ForgetPasswordDesktopTablet(),
      mobile: ForgetPasswordMobile(),
    );
  }
}
