import '../../../../utils/constants/path_provider.dart';
import '../../../media/controllers/media_controller.dart';
import '../../../media/model/image_model.dart';

class ProductImageController extends GetxController {
  static ProductImageController get instance =>
      Get.find(); // Rx Observables for the selected thumbnail image
  Rx<String?> selectedThumbnailImageUrl = Rx<String?>(null);

// Lists to store additional product images
  final RxList<String> additionalProductImagesUrls = <String>[].obs;

  /// Pick Thumbnail Image from Media
  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages =
        await controller.selectedImagesFromMedia();
// Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
// Set the selected image to the main image or perform any other action
      ImageModel selectedImage = selectedImages.first;
// Update the main image using the selectedImage
      selectedThumbnailImageUrl.value = selectedImage.url;
    }
  }

  /// Pick Multiple Images from Media
  void selectMultipleProductImages() async {
    final controller = Get.put(MediaController());
    final selectedImages = await controller.selectedImagesFromMedia(
        multipleSelection: true, selectedUrls: additionalProductImagesUrls);
// Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      additionalProductImagesUrls.assignAll(selectedImages.map((e) => e.url));
    }
  }

  /// Function to remove Product image
  Future<void> removeImage(int index) async {
    additionalProductImagesUrls.removeAt(index);
  }
}
