import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/utils/validators/validation.dart';

import '../../../../../../utils/constants/path_provider.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: TColors.primaryBackground),
        SizedBox(height: TSizes.spaceBtwSections),
        Text("Add Product Attributes", style: textTheme.headlineSmall),
        SizedBox(height: TSizes.spaceBtwItems),

        /// -- Form to add new attribute
        Form(
            child: TDeviceUtils.isDesktopScreen(context)
                ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(child: _buildAttributeName()),
                    SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(flex: 2, child: _buildAttributeTextField()),
                    SizedBox(width: TSizes.spaceBtwItems),
                    _buildAttributeButton(),
                  ])
                : Column(children: [
                    _buildAttributeName(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    _buildAttributeTextField(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    _buildAttributeButton(),
                  ])),
        SizedBox(height: TSizes.spaceBtwSections),

        /// -- List of added attributes
        Text("All Attributes", style: textTheme.headlineSmall),
        SizedBox(height: TSizes.spaceBtwItems),

        /// --- Display Added attributes in a rounded container
        TRoundedContainer(
          backgroundColor: TColors.primaryBackground,
          child: Column(
            children: [
              buildAttributeList(),
              buildEmptyAttributes(),
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwSections),

        /// --- Generation variation button
        SizedBox(
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () {},
            label: Text("Generate Variation"),
            icon: Icon(
              Iconsax.activity,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAttributeButton() {
    return SizedBox(
      width: 100,
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text("Add"),
        icon: Icon(Iconsax.add),
        style: ElevatedButton.styleFrom(
            backgroundColor: TColors.secondary,
            foregroundColor: TColors.black,
            side: BorderSide(color: TColors.secondary)),
      ),
    );
  }

  Widget _buildAttributeName() {
    return TextFormField(
      validator: (value) =>
          TValidator.validateEmptyText('Attribute Name', value),
      decoration: InputDecoration(
          labelText: 'Attribute Name', hintText: 'Colors, Sizes, Materials'),
    );
  }

  Widget _buildAttributeTextField() {
    return SizedBox(
      height: 80,
      child: TextFormField(
        validator: (value) =>
            TValidator.validateEmptyText('Attribute Field', value),
        decoration: InputDecoration(
            labelText: 'Attributes',
            hintText:
                'Add attributes separated by | Example: Green | Blue | Yellow',
            alignLabelWithHint: true),
      ),
    );
  }

  /// --- Widget for attribute list
  Widget buildAttributeList() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
            child: ListTile(
              title: Text('Color'),
              subtitle: Text('Red, Green, Orange'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.trash,
                    color: TColors.error,
                  )),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(height: TSizes.spaceBtwItems),
        itemCount: 3);
  }

  Widget buildEmptyAttributes() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(
                width: 150,
                height: 80,
                imageType: ImageType.asset,
                image: TImages.defaultAttributeColorsImageIcon),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text("There are no attributes added for this product")
      ],
    );
  }
}
