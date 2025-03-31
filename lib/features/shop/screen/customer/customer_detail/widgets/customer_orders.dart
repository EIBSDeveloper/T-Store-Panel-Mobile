import '../../../../../../utils/constants/path_provider.dart';
import '../table/data_table.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Orders", style: textTheme.headlineMedium),
              Text.rich(TextSpan(children: [
                TextSpan(text: 'Total Spent '),
                TextSpan(
                    text: '₹15224',
                    style: textTheme.bodyLarge!.apply(color: TColors.primary)),
                TextSpan(text: ' on ${5} orders', style: textTheme.bodyLarge),
              ]))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          TextFormField(
            onChanged: (query) {},
            decoration: InputDecoration(
                hintText: "Search Orders",
                prefixIcon: Icon(Iconsax.search_normal)),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          CustomerOrderTable(),
        ],
      ),
    );
  }
}
