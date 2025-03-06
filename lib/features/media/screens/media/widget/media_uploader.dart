import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/features/media/controllers/media_controller.dart';
import 'package:t_store_admin_panel/features/media/screens/media/widget/folder_dropdown.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../../utils/constants/path_provider.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => controller.showImageUploaderSection.value
          ? Column(
              children: [
                ///Drag and drop area
                TRoundedContainer(
                  height: 250,
                  showBorder: true,
                  borderColor: TColors.borderPrimary,
                  backgroundColor: TColors.primaryBackground,
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      Expanded(
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          DropzoneView(
                            mime: ['image/jpeg', 'image/png'],
                            cursor: CursorType.Default,
                            operation: DragOperation.copy,
                            onLoaded: () => print("Zone Loades"),
                            onError: (error) => print('Zone Error $error'),
                            onHover: () => print('on Hover'),
                            onLeave: () => print('on Leave'),
                            onCreated: (ctrl) =>
                                controller.dropzoneViewController = ctrl,
                            onDrop: (file) => print("on drop ${file.name}"),
                            onDropInvalid: (ev) =>
                                print('Zone Invalid MIME $ev'),
                            onDropMultiple: (ev) async {
                              print('Zone drop Multiple: $ev');
                            },
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(TImages.defaultMultiImageIcon,
                                  width: 50, height: 50),
                              SizedBox(height: TSizes.spaceBtwItems),
                              Text("Drag and Drop Image here"),
                              SizedBox(height: TSizes.spaceBtwItems),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Text('Select Image')),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                /// locally selected Image
                TRoundedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Folder Dropdown
                          Row(
                            children: [
                              Text("Select Folder",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              SizedBox(width: TSizes.spaceBtwItems),
                              MediaFolderDropdown(
                                onChanged: (MediaCategory? newValue) {
                                  if (newValue != null) {
                                    controller.selectedPath.value = newValue;
                                  }
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {}, child: Text("Remove All")),
                              SizedBox(width: TSizes.spaceBtwItems),
                              TDeviceUtils.isMobileScreen(context)
                                  ? SizedBox.shrink()
                                  : SizedBox(
                                      width: TSizes.buttonWidth,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Upload")))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: TSizes.spaceBtwItems / 2,
                        runSpacing: TSizes.spaceBtwItems / 2,
                        children: [
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                          TRoundedImage(
                            padding: TSizes.sm,
                            imageType: ImageType.asset,
                            image: TImages.darkAppLogo,
                            width: 90,
                            height: 90,
                            backgroundColor: TColors.primaryBackground,
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),
                      TDeviceUtils.isMobileScreen(context)
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {}, child: Text("Upload")))
                          : SizedBox.shrink()
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwSections),
              ],
            )
          : SizedBox.shrink(),
    );
  }
}
