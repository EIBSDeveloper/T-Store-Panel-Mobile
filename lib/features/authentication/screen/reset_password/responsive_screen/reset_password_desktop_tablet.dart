import 'package:flutter/cupertino.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/templates/login_template.dart';

import '../../../../../utils/constants/path_provider.dart';
import '../widget/reset_password_widget.dart';

class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(child: ResetPasswordWidget());
  }
}
