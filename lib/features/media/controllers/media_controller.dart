import 'dart:typed_data';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:t_store_admin_panel/features/media/model/image_model.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:universal_html/html.dart' as html;

import '../../../utils/constants/path_provider.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneController;

  final showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImageToUpload = <ImageModel>[].obs;

  Future<void> selectLocalImages() async {
    final files = await dropzoneController
        .pickFiles(multiple: true, mime: ['image/jpeg', 'image/png']);

    if (files.isNotEmpty) {
      for (var file in files) {
        if (file is html.File) {
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
  }
}
