import '../../../../../../utils/constants/path_provider.dart';
import '../../create_category/widget/create_category_form.dart';

class EditCategoriesDesktopScreen extends StatelessWidget {
  const EditCategoriesDesktopScreen({super.key});

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
                  headings: 'Update Categories',
                  returnToPreviousScreen: true,
                  breadcrumbItems: [
                    TRoutes.categories,
                    TRoutes.editCategories
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
