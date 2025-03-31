import 'package:t_store_admin_panel/features/shop/screen/customer/customer_detail/widgets/customer_info.dart';
import 'package:t_store_admin_panel/features/shop/screen/customer/customer_detail/widgets/shipping_address.dart';

import '../../../../../../utils/constants/path_provider.dart';
import '../widgets/customer_orders.dart';

class CustomerDetailDesktopScreen extends StatelessWidget {
  const CustomerDetailDesktopScreen({
    super.key,
    /*required this.customer*/
  });
  // final UserModel customer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbWithHeadings(
                  returnToPreviousScreen: true,
                  headings: 'Karthick Dinesh',
                  breadcrumbItems: [TRoutes.customer, TRoutes.customerDetails]),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Body
              Row(
                children: [
                  /// --- Left side customer info
                  Expanded(
                      child: Column(
                    children: [
                      CustomerInfo(),
                      SizedBox(height: TSizes.spaceBtwSections),
                      ShippingAddress()
                    ],
                  )),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Expanded(flex: 2, child: CustomerOrders())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
