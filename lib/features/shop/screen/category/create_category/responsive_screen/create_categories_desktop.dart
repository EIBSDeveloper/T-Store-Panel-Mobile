import '../../../../../../utils/constants/path_provider.dart';
import '../widget/create_category_form.dart';

class CreateCategoryDesktopScreen extends StatelessWidget {
  const CreateCategoryDesktopScreen({super.key});

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
                  headings: 'Create Categories',
                  returnToPreviousScreen: true,
                  breadcrumbItems: [
                    TRoutes.categories,
                    TRoutes.createCategories
                  ]),
              const SizedBox(height: TSizes.spaceBtwSections),
              CreateCategoryForm()
            ],
          ),
        ),
      ),
    );
  }
}
