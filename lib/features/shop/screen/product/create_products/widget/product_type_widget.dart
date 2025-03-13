import '../../../../../../utils/constants/path_provider.dart';

class ProductTypeWidget extends StatelessWidget {
  const ProductTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Product Type", style: textTheme.bodyMedium),
        SizedBox(width: TSizes.spaceBtwItems),
        RadioMenuButton(
            value: ProductType.single,
            groupValue: ProductType.single,
            onChanged: (value) {},
            child: Text('Single')),
        RadioMenuButton(
            value: ProductType.variable,
            groupValue: ProductType.single,
            onChanged: (value) {},
            child: Text('Variable'))
      ],
    );
  }
}
