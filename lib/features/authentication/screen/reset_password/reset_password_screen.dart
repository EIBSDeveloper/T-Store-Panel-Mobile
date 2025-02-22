import 'package:t_store_admin_panel/features/authentication/screen/reset_password/responsive_screen/reset_password_desktop_tablet.dart';
import 'package:t_store_admin_panel/features/authentication/screen/reset_password/responsive_screen/reset_password_mobile.dart';

import '../../../../utils/constants/path_provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
        useLayout: false,
        desktop: ResetPasswordDesktopTablet(),
        mobile: ResetPasswordMobile());
  }
}
