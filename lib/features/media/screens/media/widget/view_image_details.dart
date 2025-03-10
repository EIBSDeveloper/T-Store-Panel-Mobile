import 'package:flutter/services.dart';
import 'package:t_store_admin_panel/features/media/controllers/media_controller.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/path_provider.dart';
import '../../../model/image_model.dart';

class ImagePopup extends StatelessWidget {
  // The image model to display detailed information about.
  final ImageModel image;

  // Constructor for the ImagePopup class.
  const ImagePopup({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return SingleChildScrollView(
      child: Dialog(
        // Define the shape of the dialog.

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
        child: TRoundedContainer(
          // Set the width of the rounded container based on the screen size.
          width: TDeviceUtils.isDesktopScreen(context)
              ? MediaQuery.of(context).size.width * 0.4
              : double.infinity,
          padding: EdgeInsets.all(TSizes.spaceBtwItems),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the image with an option to close the dialog.
              SizedBox(
                child: Stack(
                  children: [
                    // Display the image with rounded container.
                    TRoundedContainer(
                      backgroundColor: TColors.primaryBackground,
                      child: TRoundedImage(
                        image: image.url,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: TDeviceUtils.isDesktopScreen(context)
                            ? MediaQuery.of(context).size.width * 0.4
                            : double.infinity,
                        applyImageRadius: true,
                        imageType: ImageType.network,
                      ),
                    ),
                    // Close button positioned at the top-right corner.
                    Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () => Get.back(),
                            icon: Icon(
                              Iconsax.close_circle,
                              color: Colors.red,
                            )))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              // Display image metadata about the image.
              // It also provides name, path, type size, creation and modification dates, and URL.
              // And also provides an option to copy the image URL.
              Row(
                children: [
                  Expanded(
                      child: Text('Image Name:',
                          style: Theme.of(context).textTheme.bodyLarge)),
                  Expanded(
                      flex: 3,
                      child: Text(image.filename,
                          style: Theme.of(context).textTheme.titleLarge)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text('Image URL:',
                          style: Theme.of(context).textTheme.bodyLarge)),
                  Expanded(
                    flex: 2,
                    child: Text(
                      image.url,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: image.url));
                          TLoaders.customToast(message: 'URL Copied');
                        },
                        child: Text("Copy URL")),
                  )
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextButton(
                        onPressed: () =>
                            controller.popupDeleteConfirmation(image),
                        child: Text(
                          "Delete Image",
                          style: TextStyle(color: Colors.red),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
