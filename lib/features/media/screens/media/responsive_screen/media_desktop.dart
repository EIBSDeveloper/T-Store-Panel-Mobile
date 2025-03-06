import 'package:t_store_admin_panel/features/media/controllers/media_controller.dart';
import 'package:t_store_admin_panel/features/media/screens/media/widget/media_content.dart';
import 'package:t_store_admin_panel/features/media/screens/media/widget/media_uploader.dart';

import '../../../../../common/widgets/breadcrumbs/breadcrumb_with_headings.dart';
import '../../../../../utils/constants/path_provider.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
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
                    breadcrumbItems: [TRoutes.login, TRoutes.media],
                  ),
                  SizedBox(
                    width: TSizes.buttonWidth * 1.5,
                    child: ElevatedButton.icon(
                        icon: Icon(
                          Iconsax.cloud_add,
                          color: Colors.white,
                        ),
                        onPressed: () => controller.showImageUploaderSection
                            .value = !controller.showImageUploaderSection.value,
                        label: Text('Upload Image')),
                  )
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --- upload Area
              MediaUploader(),

              /// Media Content
              MediaContent(),
            ],
          ),
        ),
      ),
    );
  }
}
