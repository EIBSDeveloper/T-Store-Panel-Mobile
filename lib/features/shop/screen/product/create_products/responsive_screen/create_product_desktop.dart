import '../../../../../../utils/constants/path_provider.dart';
import '../widget/create_product_form.dart';

class CreateProductDesktopScreen extends StatelessWidget {
  const CreateProductDesktopScreen({super.key});

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
                  headings: 'Create Product',
                  returnToPreviousScreen: true,
                  breadcrumbItems: [TRoutes.products, TRoutes.createProducts]),
              const SizedBox(height: TSizes.spaceBtwSections),
              CreateProductForm()
            ],
          ),
        ),
      ),
    );
  }
}
