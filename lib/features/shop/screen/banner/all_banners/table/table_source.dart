import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../../../utils/constants/path_provider.dart';

class BannerRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(TRoundedImage(
          width: 180,
          height: 100,
          padding: TSizes.sm,
          imageType: ImageType.asset,
          image: TImages.darkAppLogo,
          borderRadius: TSizes.borderRadiusMd,
          backgroundColor: TColors.primaryBackground)),
      DataCell(Text("Shop")),
      DataCell(Icon(Iconsax.eye, color: TColors.primary)),
      DataCell(TTableActionButtons(
        onEditPressed: () => Get.toNamed(TRoutes.editBanners, arguments: ''),
        onDeletePressed: () {},
      ))
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 20;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
