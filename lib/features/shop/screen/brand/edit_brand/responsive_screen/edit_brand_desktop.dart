import '../../../../../../utils/constants/path_provider.dart';
import '../widget/edit_brand_form.dart';

class EditBrandDesktopScreen extends StatelessWidget {
  const EditBrandDesktopScreen({super.key});

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
                  headings: 'Update Brand',
                  returnToPreviousScreen: true,
                  breadcrumbItems: [TRoutes.brands, TRoutes.editBrands]),
              const SizedBox(height: TSizes.spaceBtwSections),
              EditBrandForm()
            ],
          ),
        ),
      ),
    );
  }
}
