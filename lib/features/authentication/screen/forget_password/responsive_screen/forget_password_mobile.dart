import 'package:t_store_admin_panel/features/authentication/screen/forget_password/widget/header_and_form.dart';

import '../../../../../utils/constants/path_provider.dart';

class ForgetPasswordMobile extends StatelessWidget {
  const ForgetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: THeaderAndForm(),
        ),
      ),
    );
  }
}
