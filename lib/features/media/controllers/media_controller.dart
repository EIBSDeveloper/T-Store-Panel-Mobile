import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../utils/constants/path_provider.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;

  final showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
}
