import '../../../../../utils/constants/path_provider.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(Iconsax.eye_slash),
                  onPressed: () {},
                )),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
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
              child:
                  ElevatedButton(onPressed: () {}, child: Text(TTexts.signIn)))
        ],
      ),
    ));
  }
}
