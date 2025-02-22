import 'package:t_store_admin_panel/common/widgets/layouts/templates/login_template.dart';

import '../../../../../utils/constants/path_provider.dart';
import '../widget/header_and_form.dart';

class ForgetPasswordDesktopTablet extends StatelessWidget {
  const ForgetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(child: THeaderAndForm());
  }
}
