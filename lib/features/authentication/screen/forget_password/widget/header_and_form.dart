import '../../../../../utils/constants/path_provider.dart';

class THeaderAndForm extends StatelessWidget {
  const THeaderAndForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left)),
        SizedBox(height: TSizes.spaceBtwItems),
        Text(
          TTexts.forgetPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text(
          TTexts.forgetPasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(height: TSizes.spaceBtwSections * 2),
        Form(
            child: TextFormField(
          decoration: InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
        )),
        SizedBox(height: TSizes.spaceBtwSections),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => Get.toNamed(
                    TRoutes.resetPassword,
                    parameters: {'email': 'karthick@gmail.com'},
                  ),
              child: Text(TTexts.submit)),
        )
      ],
    );
  }
}
