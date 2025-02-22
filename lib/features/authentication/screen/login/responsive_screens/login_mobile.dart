import '../../../../../utils/constants/path_provider.dart';
import '../widget/login_form.dart';
import '../widget/login_header.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Login Header
              TLoginHeader(),

              /// -- Login Form
              TLoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
