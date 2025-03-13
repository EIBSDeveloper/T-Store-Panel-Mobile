import 'package:flutter/services.dart';
import 'package:t_store_admin_panel/common/widgets/images/image_uploader.dart';

import '../../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../../utils/constants/path_provider.dart';
import '../../../../../../utils/validators/validation.dart';

class ProductVariation extends StatelessWidget {
  const ProductVariation({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Product Variation", style: textTheme.headlineSmall),
              TextButton(onPressed: () {}, child: Text("Remove Variations"))
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, index) => SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                return _buildVariationTile();
              },
              itemCount: 4),
          _buildNoVariationTile()
        ],
      ),
    );
  }

  Widget _buildVariationTile() {
    return ExpansionTile(
      backgroundColor: TColors.lightGrey,
      collapsedBackgroundColor: TColors.lightGrey,
      childrenPadding: EdgeInsets.all(TSizes.md),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
      title: Text('Color: Green, size: Small'),
      children: [
        TImageUploader(
          right: 0,
          left: null,
          imageType: ImageType.asset,
          image: TImages.defaultImage,
          onIconButtonPressed: () {},
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                maxLength: 8,
                validator: (value) =>
                    TValidator.validateEmptyText("Stock", value),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    counterText: '',
                    labelText: "Stock",
                    hintText: "Add Stock, only numbers are allowed"),
              ),
            ),
            SizedBox(width: TSizes.spaceBtwInputFields),

            /// Pricing
            Expanded(
                child: TextFormField(
              maxLength: 10,
              validator: (value) =>
                  TValidator.validateEmptyText("Stock", value),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))
              ],
              decoration: InputDecoration(
                  counterText: '',
                  labelText: "Price",
                  hintText: "Price with up-to 2 decimals"),
            )),
            SizedBox(width: TSizes.spaceBtwInputFields),

            /// -- Sale Price
            Expanded(
                child: TextFormField(
              maxLength: 10,
              validator: (value) =>
                  TValidator.validateEmptyText("Discounted Price", value),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))
              ],
              decoration: InputDecoration(
                  counterText: '',
                  labelText: "Discounted Price",
                  hintText: "Price with up-to 2 decimals"),
            )),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwInputFields),

        /// -- Variation Description
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Add Description of this variation...'),
        ),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }

  Widget _buildNoVariationTile() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(
                width: 200,
                height: 200,
                imageType: ImageType.asset,
                image: TImages.defaultAttributeColorsImageIcon),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text("There are no Variation added for this product")
      ],
    );
  }
}
