import '../../../../../../utils/constants/path_provider.dart';

class ProductVisibilityWidget extends StatelessWidget {
  const ProductVisibilityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Visibility Header
          Text('Visibility', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Radio buttons for product visibility
          Column(
            children: [
              _buildVisibilityRadioButton(
                  ProductVisibility.published, 'Published'),
              _buildVisibilityRadioButton(ProductVisibility.hidden, 'Hidden'),
            ],
          ),
        ],
      ),
    );
  }

// Helper method to build a radio button for product visibility
  Widget _buildVisibilityRadioButton(ProductVisibility value, String label) {
    return RadioMenuButton(
        value: value,
        groupValue: ProductVisibility.published,
        onChanged: (selection) {},
        child: Text(label));
  }
}
