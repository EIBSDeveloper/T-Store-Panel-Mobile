import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../../utils/constants/path_provider.dart';

class EditBannerForm extends StatelessWidget {
  const EditBannerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 500,
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.sm),
            Text("Update Banner",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwSections),
            Column(
              children: [
                GestureDetector(
                  child: TRoundedImage(
                    width: 400,
                    height: 200,
                    imageType: ImageType.asset,
                    image: TImages.defaultImage,
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwItems),
                TextButton(onPressed: () {}, child: Text("Select Image"))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Text("Make your Banner Active or InActive",
                style: Theme.of(context).textTheme.bodyMedium),
            CheckboxMenuButton(
                value: true, onChanged: (value) {}, child: Text('Active')),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            DropdownButton(
              value: 'search',
              onChanged: (newValue) {},
              items: [
                DropdownMenuItem(
                  value: 'home',
                  child: Text('Home'),
                ),
                DropdownMenuItem(
                  value: 'search',
                  child: Text('Search'),
                ),
              ],
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text("Update"))),
            SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
