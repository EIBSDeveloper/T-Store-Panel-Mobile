import 'package:data_table_2/data_table_2.dart';

import '../../../../../../utils/constants/path_provider.dart';
import '../../../../controller/dashboard/dashboard_controller.dart';

class CustomerOrderRows extends DataTableSource {
  final controller = Get.put(DashboardController());

  @override
  DataRow? getRow(int index) {
    final order = controller.orders[index];
    // TODO: implement getRow
    return DataRow2(
        selected: false,
        onTap: () {
          // Get.toNamed(TRoutes.orderDetails);
        },
        cells: [
          DataCell(Text(
            order.id,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: TColors.primary),
          )),
          DataCell(Text(order.formattedOrderDate)),
          DataCell(Text('5 Items')),
          DataCell(
            TRoundedContainer(
              radius: TSizes.cardRadiusSm,
              padding: const EdgeInsets.symmetric(
                  vertical: TSizes.xs, horizontal: TSizes.md),
              backgroundColor:
                  THelperFunctions.getOrderStatusColor(order.status)
                      .withOpacity(0.1),
              child: Text(
                order.status.name.capitalize.toString(),
                style: TextStyle(
                    color: THelperFunctions.getOrderStatusColor(order.status)),
              ), // Text
            ), // TRounded Container
          ), // DataCell
          DataCell(Text('₹${order.totalAmount}')),
        ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.orders.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
