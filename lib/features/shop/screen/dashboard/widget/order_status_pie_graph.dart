import 'package:fl_chart/fl_chart.dart';
import 'package:t_store_admin_panel/common/widgets/containers/circular_container.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/features/shop/controller/dashboard/dashboard_controller.dart';
import 'package:t_store_admin_panel/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/path_provider.dart';

class OrderStatusPieGraph extends StatelessWidget {
  const OrderStatusPieGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return TRoundedContainer(
      child: Column(
        children: [
          Text("Order Status",
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            height: 400,
            child: PieChart(PieChartData(
                // centerSpaceRadius: 10,
                sections: controller.orderStatusData.entries.map((entry) {
                  final status = entry.key;
                  final count = entry.value;
                  return PieChartSectionData(
                      radius: 100,
                      color: THelperFunctions.getOrderStatusColor(status),
                      title: count.toString(),
                      value: count.toDouble(),
                      titleStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold));
                }).toList(),
                pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                    enabled: true))),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                    "Status",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Orders",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Total",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
                rows: controller.orderStatusData.entries.map((entry) {
                  final OrderStatus status = entry.key;
                  final int count = entry.value;
                  final totalAmount = controller.totalAmount[status] ?? 0;
                  return DataRow(cells: [
                    DataCell(Row(
                      children: [
                        TCircularContainer(
                          width: 20,
                          height: 20,
                          backgroundColor:
                              THelperFunctions.getOrderStatusColor(status),
                        ),
                        Expanded(
                            child: Text(
                          " ${controller.getDisplayStatusName(status)}",
                          textAlign: TextAlign.center,
                        ))
                      ],
                    )),
                    DataCell(Text(
                      count.toString(),
                      textAlign: TextAlign.center,
                    )),
                    DataCell(Text('₹${totalAmount.toStringAsFixed(2)}')),
                  ]);
                }).toList()),
          )
        ],
      ),
    );
  }
}
