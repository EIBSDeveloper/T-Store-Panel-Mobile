import 'package:t_store_admin_panel/features/authentication/controller/login_controller.dart';
import 'package:t_store_admin_panel/utils/validators/validation.dart';

import '../../../../../utils/constants/path_provider.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                decoration: InputDecoration(
                    labelText: TTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: TTexts.password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye))),
                ),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) {
                              controller.rememberMe.value = value!;
                            }),
                      ),
                      Text(TTexts.rememberMe)
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.toNamed(TRoutes.forgetPassword),
                      child: Text(TTexts.forgetPassword))
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      // onPressed: () => controller.emailAndPasswordSignIn(),
                      onPressed: () => controller.registerAdmin(),
                      child: Text(TTexts.signIn)))
            ],
          ),
        ));
  }
}
