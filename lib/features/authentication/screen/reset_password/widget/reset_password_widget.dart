import 'package:flutter/cupertino.dart';

import '../../../../../utils/constants/path_provider.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () => Get.offAllNamed(TRoutes.login),
              icon: Icon(CupertinoIcons.clear)),
          SizedBox(height: TSizes.spaceBtwItems),
          Image(
              image: AssetImage(TImages.deliveredEmailIllustration),
              width: 250,
              height: 250),
          SizedBox(height: TSizes.spaceBtwItems),
          Text(
            TTexts.changeYourPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Text(
            email ?? '',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Text(
            TTexts.changeYourPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.offAllNamed(TRoutes.login),
                child: Text(TTexts.done)),
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child:
                TextButton(onPressed: () {}, child: Text(TTexts.resendEmail)),
          )
        ]);
  }
}
