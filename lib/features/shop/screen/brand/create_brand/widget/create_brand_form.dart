import 'package:t_store_admin_panel/common/widgets/chips/rounded_choice_chips.dart';
import 'package:t_store_admin_panel/common/widgets/images/image_uploader.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/validators/validation.dart';

import '../../../../../../utils/constants/path_provider.dart';

class CreateBrandForm extends StatelessWidget {
  const CreateBrandForm({super.key});

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
            Text("Create New Brand",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              validator: (value) => TValidator.validateEmptyText("Name", value),
              decoration: InputDecoration(
                  labelText: "Brand Name", prefixIcon: Icon(Iconsax.box)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Text("Select Categories",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            Wrap(
              spacing: TSizes.sm,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: TDeviceUtils.isMobileScreen(Get.context!)
                          ? 0
                          : TSizes.xs),
                  child: TChoiceChip(
                    text: "Jewellery",
                    selected: true,
                    onSelected: (value) {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: TDeviceUtils.isMobileScreen(Get.context!)
                          ? 0
                          : TSizes.xs),
                  child: TChoiceChip(
                    text: "Watches",
                    selected: true,
                    onSelected: (value) {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: TDeviceUtils.isMobileScreen(Get.context!)
                          ? 0
                          : TSizes.xs),
                  child: TChoiceChip(
                    text: "Mobile",
                    selected: false,
                    onSelected: (value) {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: TDeviceUtils.isMobileScreen(Get.context!)
                          ? 0
                          : TSizes.xs),
                  child: TChoiceChip(
                    text: "Shoes",
                    selected: false,
                    onSelected: (value) {},
                  ),
                ),
              ],
            ),
            TImageUploader(
              width: 80,
              height: 80,
              imageType: ImageType.asset,
              image: TImages.defaultImage,
              onIconButtonPressed: () {},
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),
            CheckboxMenuButton(
                value: true, onChanged: (value) {}, child: Text("Feature")),
            SizedBox(height: TSizes.spaceBtwInputFields * 2),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text("Create"))),
            SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
