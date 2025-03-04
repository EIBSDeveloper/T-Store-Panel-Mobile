import '../../../../../common/widgets/breadcrumbs/breadcrumb_with_headings.dart';
import '../../../../../utils/constants/path_provider.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Headers
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TBreadcrumbWithHeadings(
                    headings: 'Media',
                    breadcrumbItems: [
                      TRoutes.login,
                      TRoutes.resetPassword,
                      TRoutes.forgetPassword
                    ],
                  )
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
