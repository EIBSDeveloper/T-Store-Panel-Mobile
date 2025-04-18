import '../../../../../utils/constants/path_provider.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                width: 100,
                height: 100,
                image: AssetImage(TImages.darkAppLogo)),
            SizedBox(height: TSizes.spaceBtwSections),
            Text(TTexts.loginTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: TSizes.sm),
            Text(
              TTexts.loginSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ));
  }
}
