import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/common/widgets/loaders/animation_loader.dart';
import 'package:t_store_admin_panel/common/widgets/loaders/loader_animation.dart';
import 'package:t_store_admin_panel/features/media/screens/media/widget/folder_dropdown.dart';
import 'package:t_store_admin_panel/features/media/screens/media/widget/view_image_details.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../../utils/constants/path_provider.dart';
import '../../../controllers/media_controller.dart';
import '../../../model/image_model.dart';

class MediaContent extends StatelessWidget {
  MediaContent(
      {super.key,
      required this.allowSelection,
      required this.allowMultipleSelection,
      this.alreadySelectedUrls,
      this.onImagesSelected});

  final bool allowSelection;
  final bool allowMultipleSelection;
  final List<String>? alreadySelectedUrls;
  final List<ImageModel> selectedImages = [];
  final Function(List<ImageModel> selectedImages)? onImagesSelected;

  @override
  Widget build(BuildContext context) {
    bool loadedPreviousSelection = false;
    final controller = MediaController.instance;
    return TRoundedContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Select Folder",
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(width: TSizes.spaceBtwItems),
                  MediaFolderDropdown(onChanged: (MediaCategory? newValue) {
                    if (newValue != null) {
                      controller.selectedFolderPath.value = newValue;
                      controller.getMediaImages();
                    }
                  }),
                ],
              ),
              if (allowSelection) buildAddSelectedImageButton()
            ],
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          Obx(
            () {
              List<ImageModel> images = _getSelectedFolderImages(controller);
              if (!loadedPreviousSelection) {
                if (alreadySelectedUrls != null &&
                    alreadySelectedUrls!.isNotEmpty) {
                  /// Convert alreadySelectedUrl to a set for faster lookup
                  final selectedUrlSets =
                      Set<String>.from(alreadySelectedUrls!);
                  for (var image in images) {
                    image.isSelected.value =
                        selectedUrlSets.contains(image.url);
                    if (image.isSelected.value) {
                      selectedImages.add(image);
                    }
                  }
                } else {
                  for (var image in images) {
                    image.isSelected.value = false;
                  }
                }
                loadedPreviousSelection = true;
              }
              if (controller.isLoading.value && images.isEmpty) {
                return const TLoaderAnimation();
              }

              if (images.isEmpty) return _buildEmptyAnimatiionWidget(context);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: TSizes.spaceBtwItems / 2,
                    runSpacing: TSizes.spaceBtwItems / 2,
                    children: images
                        .map((image) => GestureDetector(
                              onTap: () => Get.dialog(
                                ImagePopup(image: image),
                              ),
                              child: SizedBox(
                                width: 140,
                                height: 140,
                                child: Column(
                                  children: [
                                    allowSelection
                                        ? _buildListWithCheckBox(image)
                                        : _buildSimpleList(image),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: TSizes.sm),
                                      child: Text(image.filename,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ))
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),

                  /// Load More Media Button
                  if (!controller.isLoading.value)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.spaceBtwSections),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: TSizes.buttonWidth,
                            child: ElevatedButton.icon(
                              onPressed: () => controller.loadMoreMediaImage(),
                              label: const Text('Load More'),
                              icon: const Icon(Iconsax.arrow_down,
                                  color: Colors.white),
                            ), // ElevatedButton.icon
                          ), // SizedBox
                        ],
                      ), // Row
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  List<ImageModel> _getSelectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];
    if (controller.selectedFolderPath.value == MediaCategory.banners) {
      images = controller.allBannerImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedFolderPath.value == MediaCategory.brands) {
      images = controller.allBrandImage
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedFolderPath.value ==
        MediaCategory.categories) {
      images = controller.allCategoryImage
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedFolderPath.value == MediaCategory.products) {
      images = controller.allProductImage
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedFolderPath.value == MediaCategory.users) {
      images = controller.allUserImage
          .where((image) => image.url.isNotEmpty)
          .toList();
      return images;
    }
    return images;
  }

  Widget _buildEmptyAnimatiionWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.sm),
      child: TAnimationLoaderWidget(
        width: 200,
        height: 200,
        text: 'Select Your Desire Folder',
        animation: TImages.packageAnimation,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildSimpleList(ImageModel image) {
    return TRoundedImage(
        width: 120,
        height: 120,
        padding: TSizes.sm,
        imageType: ImageType.network,
        image: image.url,
        margin: TSizes.spaceBtwItems / 2,
        backgroundColor: TColors.primaryBackground);
  }

  Widget _buildListWithCheckBox(ImageModel image) {
    return Stack(
      children: [
        TRoundedImage(
            width: 120,
            height: 120,
            padding: TSizes.sm,
            imageType: ImageType.network,
            image: image.url,
            margin: TSizes.spaceBtwItems / 2,
            backgroundColor: TColors.primaryBackground),
        Positioned(
            child: Obx(() => Checkbox(
                value: image.isSelected.value,
                onChanged: (selected) {
                  if (selected != null) {
                    image.isSelected.value = selected;

                    if (selected) {
                      if (!allowMultipleSelection) {
                        for (var otherImage in selectedImages) {
                          if (otherImage != image) {
                            otherImage.isSelected.value = false;
                          }
                        }
                        selectedImages.clear();
                      }
                      selectedImages.add(image);
                    } else {
                      selectedImages.remove(image);
                    }
                  }
                })))
      ],
    );
  }

  Widget buildAddSelectedImageButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 120,
          child: OutlinedButton.icon(
            onPressed: () => Get.back(),
            label: Text("Close"),
            icon: Icon(Iconsax.close_circle),
          ),
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        SizedBox(
          width: 120,
          child: ElevatedButton.icon(
            onPressed: () => Get.back(result: selectedImages),
            label: const Text("Add"),
            icon: const Icon(
              Iconsax.image,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
