import '../../../../../../common/widgets/data_table/table_header.dart';
import '../../../../../../utils/constants/path_provider.dart';
import '../table/data_table.dart';

class BrandDesktopScreen extends StatelessWidget {
  const BrandDesktopScreen({super.key});

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
                  headings: 'Brands', breadcrumbItems: [TRoutes.brands]),
              SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(
                        buttonText: "Create New Brands",
                        onPressed: () => Get.toNamed(TRoutes.createBrands)),
                    SizedBox(height: TSizes.spaceBtwItems),
                    BrandTable()
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
