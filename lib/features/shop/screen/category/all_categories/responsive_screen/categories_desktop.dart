import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_headings.dart';

import '../../../../../../utils/constants/path_provider.dart';
import '../widget/table_header.dart';

class CategoriesDesktopScreen extends StatelessWidget {
  const CategoriesDesktopScreen({super.key});

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
                  children: [CategoryTableHeader()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
