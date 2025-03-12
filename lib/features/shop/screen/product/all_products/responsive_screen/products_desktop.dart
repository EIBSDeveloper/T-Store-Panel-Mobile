import '../../../../../../common/widgets/data_table/table_header.dart';
import '../../../../../../utils/constants/path_provider.dart';
import '../table/data_table.dart';

class ProductDesktopScreen extends StatelessWidget {
  const ProductDesktopScreen({super.key});

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
                  headings: 'Products', breadcrumbItems: [TRoutes.products]),
              SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(
                        buttonText: "Add Products",
                        onPressed: () => Get.toNamed(TRoutes.createProducts)),
                    SizedBox(height: TSizes.spaceBtwItems),
                    ProductTable()
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
