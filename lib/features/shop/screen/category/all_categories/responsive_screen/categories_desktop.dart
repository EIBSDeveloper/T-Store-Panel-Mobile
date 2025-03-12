import 'package:t_store_admin_panel/features/shop/screen/category/all_categories/table/data_table.dart';

import '../../../../../../common/widgets/data_table/table_header.dart';
import '../../../../../../utils/constants/path_provider.dart';

class CategoryDesktopScreen extends StatelessWidget {
  const CategoryDesktopScreen({super.key});

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
                  headings: 'Categories',
                  breadcrumbItems: [TRoutes.categories]),
              SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(
                        buttonText: "Create New Category",
                        onPressed: () => Get.toNamed(TRoutes.createCategories)),
                    SizedBox(height: TSizes.spaceBtwItems),
                    CategoryTable()
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
