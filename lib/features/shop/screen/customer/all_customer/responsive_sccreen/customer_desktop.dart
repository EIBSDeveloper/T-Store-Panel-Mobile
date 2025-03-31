import 'package:t_store_admin_panel/features/shop/screen/customer/all_customer/table/data_table.dart';

import '../../../../../../common/widgets/data_table/table_header.dart';
import '../../../../../../utils/constants/path_provider.dart';

class CustomerDesktopScreen extends StatelessWidget {
  const CustomerDesktopScreen({super.key});

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
                  headings: 'Customer', breadcrumbItems: [TRoutes.customer]),
              SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(showLeftWidget: false),
                    SizedBox(height: TSizes.spaceBtwItems),
                    CustomerTable()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
