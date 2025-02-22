import 'package:t_store_admin_panel/common/widgets/layouts/templates/login_template.dart';

import '../../../../../utils/constants/path_provider.dart';
import '../widget/login_form.dart';
import '../widget/login_header.dart';

class LoginDesktopTabletScreen extends StatelessWidget {
  const LoginDesktopTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(
      child: Column(
        children: [
          /// -- Login Header
          TLoginHeader(),

          /// -- Login Form
          TLoginForm()
        ],
      ),
    );
  }
}
