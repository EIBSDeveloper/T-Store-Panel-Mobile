import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../../../utils/constants/path_provider.dart';

class ProductRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(Row(
        children: [
          TRoundedImage(
              width: 50,
              height: 50,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              borderRadius: TSizes.borderRadiusMd,
              backgroundColor: TColors.primaryBackground),
          SizedBox(width: TSizes.spaceBtwItems),
          Flexible(
            child: Text(
              "Product Title",
              style: Theme.of(Get.context!)
                  .textTheme
                  .bodyLarge!
                  .apply(color: TColors.primary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      )),
      DataCell(Text("256")),
      DataCell(Row(
        children: [
          TRoundedImage(
              width: 35,
              height: 35,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              borderRadius: TSizes.borderRadiusMd,
              backgroundColor: TColors.primaryBackground),
          SizedBox(width: TSizes.spaceBtwItems),
          Flexible(
            child: Text(
              "Nike",
              style: Theme.of(Get.context!)
                  .textTheme
                  .bodyLarge!
                  .apply(color: TColors.primary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      )),
      DataCell(Text("₹ 480")),
      DataCell(Text(DateTime.now().toString())),
      DataCell(TTableActionButtons(
        onEditPressed: () => Get.toNamed(TRoutes.editProducts, arguments: ''),
        onDeletePressed: () {},
      ))
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 105;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
