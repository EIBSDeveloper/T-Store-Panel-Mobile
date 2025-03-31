import '../../../../../../utils/constants/path_provider.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Shipping Address", style: textTheme.headlineMedium),
          SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
