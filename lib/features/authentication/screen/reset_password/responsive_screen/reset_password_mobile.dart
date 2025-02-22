import 'package:t_store_admin_panel/features/authentication/screen/reset_password/widget/reset_password_widget.dart';

import '../../../../../utils/constants/path_provider.dart';

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ResetPasswordWidget(),
        ),
      ),
    );
  }
}
