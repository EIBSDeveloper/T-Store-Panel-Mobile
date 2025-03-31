import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/features/authentication/model/user_model.dart';

import '../../../../../../utils/constants/path_provider.dart';

class CustomerRows extends DataTableSource {
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
            backgroundColor: TColors.primaryBackground,
          ),
          SizedBox(width: TSizes.spaceBtwItems),
          Expanded(
            child: Text(
              "Karthick",
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
      DataCell(Text("karthickd602@gmail.com")),
      DataCell(Text("+91-7094930770")),
      DataCell(Text(DateTime.now().toString())),
      DataCell(TTableActionButtons(
        view: true,
        edit: false,
        onViewPressed: () =>
            Get.toNamed(TRoutes.customerDetails, arguments: UserModel.empty()),
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
