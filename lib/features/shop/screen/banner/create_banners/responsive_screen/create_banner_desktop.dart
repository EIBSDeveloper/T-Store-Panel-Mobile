import '../../../../../../utils/constants/path_provider.dart';
import '../widget/create_banner_form.dart';

class CreateBannerDesktopScreen extends StatelessWidget {
  const CreateBannerDesktopScreen({super.key});

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
                  headings: 'Create Banner',
                  returnToPreviousScreen: true,
                  breadcrumbItems: [TRoutes.banners, TRoutes.createBanners]),
              const SizedBox(height: TSizes.spaceBtwSections),
              CreateBannerForm()
            ],
          ),
        ),
      ),
    );
  }
}
