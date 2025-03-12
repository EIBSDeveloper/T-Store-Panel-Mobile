import '../../../../../../utils/constants/path_provider.dart';
import '../widget/create_brand_form.dart';

class CreateBrandDesktopScreen extends StatelessWidget {
  const CreateBrandDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TBreadcrumbWithHeadings(
                  headings: 'Create Brand',
                  returnToPreviousScreen: true,
                  breadcrumbItems: [TRoutes.brands, TRoutes.createBrands]),
              const SizedBox(height: TSizes.spaceBtwSections),
              CreateBrandForm()
            ],
          ),
        ),
      ),
    );
  }
}
