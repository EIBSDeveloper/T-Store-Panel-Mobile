import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../../../utils/constants/path_provider.dart';

class BrandRows extends DataTableSource {
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
          Expanded(
            child: Text(
              "T-Store",
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
      DataCell(Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            spacing: TSizes.xs,
            direction: TDeviceUtils.isMobileScreen(Get.context!)
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: TDeviceUtils.isMobileScreen(Get.context!)
                        ? 0
                        : TSizes.xs),
                child: Chip(
                  label: Text("Shoes"),
                  padding: EdgeInsets.all(TSizes.xs),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: TDeviceUtils.isMobileScreen(Get.context!)
                        ? 0
                        : TSizes.xs),
                child: Chip(
                  label: Text("Jewellery"),
                  padding: EdgeInsets.all(TSizes.xs),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: TDeviceUtils.isMobileScreen(Get.context!)
                        ? 0
                        : TSizes.xs),
                child: Chip(
                  label: Text("Watches"),
                  padding: EdgeInsets.all(TSizes.xs),
                ),
              ),
            ],
          ),
        ),
      )),
      DataCell(Icon(Iconsax.heart5, color: TColors.primary)),
      DataCell(Text(DateTime.now().toString())),
      DataCell(TTableActionButtons(
        onEditPressed: () => Get.toNamed(TRoutes.editBrands, arguments: ''),
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
