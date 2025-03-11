import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:t_store_admin_panel/common/widgets/loaders/circular_loader.dart';
import 'package:t_store_admin_panel/data/repository/media/media_repository.dart';
import 'package:t_store_admin_panel/features/media/model/image_model.dart';
import 'package:t_store_admin_panel/features/media/screens/media/widget/media_content.dart';
import 'package:t_store_admin_panel/features/media/screens/media/widget/media_uploader.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/popups/dialogs.dart';
import 'package:t_store_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

import '../../../utils/constants/path_provider.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  final isLoading = false.obs;
  int initialLoadCount = 10;
  int loadMoreCount = 25;
  late DropzoneViewController dropzoneController;

  final showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedFolderPath = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImageToUpload = <ImageModel>[].obs;

  final RxList<ImageModel> allImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBannerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allProductImage = <ImageModel>[].obs;
  final RxList<ImageModel> allBrandImage = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImage = <ImageModel>[].obs;
  final RxList<ImageModel> allUserImage = <ImageModel>[].obs;

  /// Media Repository
  final MediaRepository mediaRepository = MediaRepository();

  void getMediaImages() async {
    try {
      isLoading.value = true;
      RxList<ImageModel> targetList = <ImageModel>[].obs;
      if (selectedFolderPath.value == MediaCategory.banners &&
          allBannerImages.isEmpty) {
        targetList = allBannerImages;
      } else if (selectedFolderPath.value == MediaCategory.brands &&
          allBrandImage.isEmpty) {
        targetList = allBrandImage;
      } else if (selectedFolderPath.value == MediaCategory.categories &&
          allCategoryImage.isEmpty) {
        targetList = allCategoryImage;
      } else if (selectedFolderPath.value == MediaCategory.products &&
          allProductImage.isEmpty) {
        targetList = allProductImage;
      } else if (selectedFolderPath.value == MediaCategory.users &&
          allUserImage.isEmpty) {
        targetList = allUserImage;
      }

      final images = await mediaRepository.fetchImagesFromDatabase(
          selectedFolderPath.value, initialLoadCount);
      targetList.assignAll(images);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error in getMediaImages: $e");
    }
  }

  void loadMoreMediaImage() async {
    try {
      isLoading.value = true;
      RxList<ImageModel> targetList = <ImageModel>[].obs;
      if (selectedFolderPath.value == MediaCategory.banners &&
          allBannerImages.isEmpty) {
        targetList = allBannerImages;
      } else if (selectedFolderPath.value == MediaCategory.brands &&
          allBrandImage.isEmpty) {
        targetList = allBrandImage;
      } else if (selectedFolderPath.value == MediaCategory.categories &&
          allCategoryImage.isEmpty) {
        targetList = allCategoryImage;
      } else if (selectedFolderPath.value == MediaCategory.products &&
          allProductImage.isEmpty) {
        targetList = allProductImage;
      } else if (selectedFolderPath.value == MediaCategory.users &&
          allUserImage.isEmpty) {
        targetList = allUserImage;
      }

      final images = await mediaRepository.loadMoreImagesFromDatabase(
          selectedFolderPath.value,
          loadMoreCount,
          targetList.last.createdAt ?? DateTime.now());
      targetList.addAll(images);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error in getMediaImages: $e");
    }
  }

  Future<void> selectLocalImages() async {
    final files = await dropzoneController
        .pickFiles(multiple: true, mime: ['image/jpeg', 'image/png']);

    if (files.isNotEmpty) {
      for (var file in files) {
        final bytes = await dropzoneController.getFileData(file);

        final image = ImageModel(
            url: '',
            folder: '',
            filename: file.name,
            file: file,
            localImageToDisplay: Uint8List.fromList(bytes));
        selectedImageToUpload.add(image);
      }
    }
  }

  void uploadImagesConfirmation() {
    if (selectedFolderPath.value == MediaCategory.folders) {
      TLoaders.warningSnackBar(
          title: "Select Folder",
          message: 'Please select the folder in order to upload the image');
      return;
    }
    TDialogs.defaultDialog(
        context: Get.context!,
        title: 'Upload Images',
        confirmTextBackgroundColor: TColors.primary,
        onConfirm: () async => await uploadImage(),
        content:
            "Are You sure you want to upload all the Images in ${selectedFolderPath.value.name.toUpperCase()} folder?",
        confirmText: "Upload");
  }

  Future<void> uploadImage() async {
    try {
      /// -- Close the confirm dialog
      Navigator.of(Get.context!).pop();

      /// -- Start Loader
      uploadImageLoader();

      ///  --- Get the selected Category
      // MediaCategory selectedCategory = selectedFolderPath.value;

      /// --- Get the corresponding list to update
      RxList<ImageModel> targetList;

      /// -- check the selected category and update the corresponding list
      switch (selectedFolderPath.value) {
        case MediaCategory.banners:
          targetList = allBannerImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImage;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImage;
          break;
        case MediaCategory.products:
          targetList = allProductImage;
          break;
        case MediaCategory.users:
          targetList = allUserImage;
          break;
        default:
          return;
      }

      for (int i = selectedImageToUpload.length - 1; i >= 0; i--) {
        var selectedImage = selectedImageToUpload[i];
        final image = selectedImage.file!;
        final file = await dropzoneController.getFileData(image);

        /// --- upload Image to the firestore
        final ImageModel uploadImage =
            await mediaRepository.uploadImageFileInStorage(
                file: Uint8List.fromList(file),
                path: getSelectedPath(),
                imageName: selectedImage.filename);
        uploadImage.mediaCategory = selectedFolderPath.value.name;
        final id = await mediaRepository.uploadImageToFirebase(uploadImage);
        uploadImage.id = id;
        selectedImageToUpload.removeAt(i);
        targetList.add(uploadImage);
      }
      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      if (kDebugMode) {
        print("Error in uploadImagesConfirmation $e");
      }
      TLoaders.warningSnackBar(
          title: "Error Uploading Images",
          message: "Something went wrong while uploading image");
    }
  }

  void uploadImageLoader() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => PopScope(
            canPop: false,
            child: AlertDialog(
              title: Text("Uploading Images"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    TImages.uploadingImageIllustration,
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Text("Sit Tight, Your images are Uploading...")
                ],
              ),
            )));
  }

  String getSelectedPath() {
    String path = '';
    switch (selectedFolderPath.value) {
      case MediaCategory.banners:
        path = TTexts.bannersStoragePath;
        break;
      case MediaCategory.brands:
        path = TTexts.brandsStoragePath;
        break;
      case MediaCategory.categories:
        path = TTexts.categoriesStoragePath;
        break;
      case MediaCategory.products:
        path = TTexts.productsStoragePath;
        break;
      case MediaCategory.users:
        path = TTexts.usersStoragePath;
        break;
      default:
        path = 'Others';
    }
    return path;
  }

  /// -- Delete confirmation
  void popupDeleteConfirmation(ImageModel image) {
    TDialogs.defaultDialog(
        context: Get.context!,
        content: "Are you sure you want to delete this image",
        title: 'Delete Confirmation',
        onConfirm: () {
          // Navigator.of(Get.context!).pop;
          Get.back();

          removeCloudImages(image);
        });
  }

  /// -- Delete Images
  void removeCloudImages(ImageModel image) async {
    try {
      // Navigator.of(Get.context!).pop;
      Get.back();
      Get.defaultDialog(
          title: '',
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: PopScope(
              canPop: false,
              child: SizedBox(
                width: 150,
                height: 150,
                child: TCircularLoader(),
              )));

      await mediaRepository.deleteImageFromStorage(image);
      RxList<ImageModel> targetList;

      /// -- check the selected category and update the corresponding list
      switch (selectedFolderPath.value) {
        case MediaCategory.banners:
          targetList = allBannerImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImage;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImage;
          break;
        case MediaCategory.products:
          targetList = allProductImage;
          break;
        case MediaCategory.users:
          targetList = allUserImage;
          break;
        default:
          return;
      }
      targetList.remove(image);
      update();
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Image Deleted",
          message: "Image Successfully delete from your storage");
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  ///-- Image selected from bottom sheet

  Future<List<ImageModel>?> selectedImagesFromMedia(
      {List<String>? selectedUrls,
      bool allowSelection = true,
      bool multipleSelection = false}) async {
    showImageUploaderSection.value = true;

    List<ImageModel>? selectedImages = await Get.bottomSheet<List<ImageModel>>(
        isScrollControlled: true,
        backgroundColor: TColors.primaryBackground,
        FractionallySizedBox(
          heightFactor: 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  MediaUploader(),
                  MediaContent(
                      allowSelection: allowSelection,
                      alreadySelectedUrls: selectedUrls ?? [],
                      allowMultipleSelection: multipleSelection)
                ],
              ),
            ),
          ),
        ));
  }
}
