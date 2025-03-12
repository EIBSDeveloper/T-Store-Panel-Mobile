import '../../../../../../common/widgets/data_table/table_header.dart';
import '../../../../../../utils/constants/path_provider.dart';
import '../table/data_table.dart';

class BannerDesktopScreen extends StatelessWidget {
  const BannerDesktopScreen({super.key});

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
                  headings: 'Banners', breadcrumbItems: [TRoutes.banners]),
              SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(
                        buttonText: "Create New Banners",
                        onPressed: () => Get.toNamed(TRoutes.createBanners)),
                    SizedBox(height: TSizes.spaceBtwItems),
                    BannerTable()
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
