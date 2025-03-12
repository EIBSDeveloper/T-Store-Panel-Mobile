import 'package:t_store_admin_panel/common/widgets/images/image_uploader.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/validators/validation.dart';

import '../../../../../../utils/constants/path_provider.dart';

class CreateCategoryForm extends StatelessWidget {
  const CreateCategoryForm({super.key});

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
            Text(
              "Update  Category",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              validator: (value) => TValidator.validateEmptyText("Name", value),
              decoration: InputDecoration(
                  labelText: "Category Name",
                  prefixIcon: Icon(Iconsax.category)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            DropdownButtonFormField(
                decoration: InputDecoration(
                    labelText: "Parent Name",
                    // hintText: "Parent Name",
                    prefixIcon: Icon(Iconsax.bezier)),
                items: [
                  DropdownMenuItem(
                      value: '',
                      child: Row(
                        children: [Text("data 1")],
                      ))
                ],
                onChanged: (newValue) {}),
            SizedBox(height: TSizes.spaceBtwInputFields * 2),
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
                child: ElevatedButton(onPressed: () {}, child: Text("Update"))),
            SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
