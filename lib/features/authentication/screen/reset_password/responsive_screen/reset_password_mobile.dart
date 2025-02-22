import '../../../../../utils/constants/path_provider.dart';
import '../widget/reset_password_widget.dart';

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
