import 'package:t_store_admin_panel/utils/validators/validation.dart';

import '../../../../../../utils/constants/path_provider.dart';

class ProductTitleAndDescription extends StatelessWidget {
  const ProductTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Basic Information", style: textTheme.headlineSmall),
            SizedBox(height: TSizes.spaceBtwItems),

            /// Product title Input field
            TextFormField(
                validator: (value) =>
                    TValidator.validateEmptyText("Product Title", value),
                decoration: InputDecoration(labelText: 'Product Title')),
            SizedBox(height: TSizes.spaceBtwInputFields),
            SizedBox(
                height: 300,
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  validator: (value) => TValidator.validateEmptyText(
                      "Product Description", value),
                  decoration: InputDecoration(
                      labelText: 'Product Description',
                      hintText: 'Add your Product Description here...',
                      alignLabelWithHint: true),
                ))
          ],
        ),
      ),
    );
  }
}
