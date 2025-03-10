import 'package:t_store_admin_panel/features/media/controllers/media_controller.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../../utils/constants/path_provider.dart';

class MediaFolderDropdown extends StatelessWidget {
  const MediaFolderDropdown({super.key, this.onChanged});

  final void Function(MediaCategory?)? onChanged;
  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;

    return Obx(
      () => SizedBox(
        width: 140.0,
        child: DropdownButtonFormField(
            isExpanded: false,
            value: controller.selectedFolderPath.value,
            items: MediaCategory.values
                .map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.capitalize.toString())))
                .toList(),
            onChanged: onChanged),
      ),
    );
  }
}
