import 'package:t_store_admin_panel/features/shop/screen/banner/edit_banners/widget/edit_banner_form.dart';

import '../../../../../../utils/constants/path_provider.dart';

class EditProductDesktopScreen extends StatelessWidget {
  const EditProductDesktopScreen({super.key});

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
                  headings: 'Update Banner',
                  returnToPreviousScreen: true,
                  breadcrumbItems: [TRoutes.banners, TRoutes.editBanners]),
              const SizedBox(height: TSizes.spaceBtwSections),
              EditBannerForm()
            ],
          ),
        ),
      ),
    );
  }
}
