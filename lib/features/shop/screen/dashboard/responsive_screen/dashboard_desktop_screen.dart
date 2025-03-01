import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';

import '../../../../../utils/constants/path_provider.dart';
import '../widget/dashboard_card.dart';
import '../widget/order_status_pie_graph.dart';
import '../widget/weekly_sales_chart.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Header
              Text("Dashboard",
                  style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Card
              Row(
                children: [
                  Expanded(
                    child: TDashboardCard(
                        title: 'Sales Total', stats: 25, subTitle: '₹36545.6'),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashboardCard(
                        title: 'Average Order Value',
                        stats: 15,
                        subTitle: '2051.6'),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashboardCard(
                        title: 'Total Orders', stats: 44, subTitle: '36'),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                      child: TDashboardCard(
                          title: 'Visitors', stats: 2, subTitle: '6501')),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Graph
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        /// -- Bar Graph
                        TWeeklySalesGraph(),
                        SizedBox(height: TSizes.spaceBtwSections),

                        /// --- Orders
                        TRoundedContainer(),
                      ],
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwSections),

                  /// -- Pie Chart
                  Expanded(child: OrderStatusPieGraph())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// class MyData extends DataTableSource {
//   final controller = Get.put(DashboardController());
//
//   @override
//   DataRow? getRow(int index) {
//     final data = controller.filteredDataList[index];
//
//     return DataRow2(
//         onTap: () {
//           print("Row :${index + 1} is clicked");
//         },
//         selected: controller.selectedRow[index],
//         onSelectChanged: (value) =>
//             controller.selectedRow[index] = value ?? false,
//         cells: [
//           DataCell(
//             Text(data['column 1'] ?? ''),
//           ),
//           DataCell(
//             Text(data['column 2'] ?? ''),
//           ),
//           DataCell(
//             Text(data['column 3'] ?? ''),
//           ),
//           DataCell(
//             Text(data['column 4'] ?? ''),
//           ),
//         ]);
//   }
//
//   @override
//   bool get isRowCountApproximate => false;
//
//   @override
//   int get rowCount => controller.filteredDataList.length;
//
//   @override
//   int get selectedRowCount => 0;
// }
//
// class DashboardController extends GetxController {
//   var filteredDataList = <Map<String, dynamic>>[].obs;
//   var dataList = <Map<String, dynamic>>[].obs;
//
//   RxList<bool> selectedRow = <bool>[].obs;
//   RxInt sortColumnIndex = 1.obs;
//   RxBool sortAscending = true.obs;
//
//   TextEditingController searchTextController = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchDummyData();
//   }
//
//   void fetchDummyData() {
//     selectedRow.assignAll(List.generate(36, (index) => false));
//     dataList.addAll(List.generate(
//         36,
//         (index) => {
//               'column 1': 'Data ${index + 1} - 1',
//               'column 2': 'Data ${index + 1} - 2',
//               'column 3': 'Data ${index + 1} - 3',
//               'column 4': 'Data ${index + 1} - 4',
//             }));
//     filteredDataList.addAll(List.generate(
//         36,
//         (index) => {
//               'column 1': 'Data ${index + 1} - 1',
//               'column 2': 'Data ${index + 1} - 2',
//               'column 3': 'Data ${index + 1} - 3',
//               'column 4': 'Data ${index + 1} - 4',
//             }));
//   }
//
//   void sortById(int sortColumnIndex, bool ascending) {
//     sortAscending.value = ascending;
//     filteredDataList.sort((a, b) {
//       if (ascending) {
//         return filteredDataList[0]['column 1']
//             .toString()
//             .toLowerCase()
//             .compareTo(
//                 filteredDataList[0]['column 1'].toString().toLowerCase());
//       } else {
//         return filteredDataList[0]['column 1']
//             .toString()
//             .toLowerCase()
//             .compareTo(
//                 filteredDataList[0]['column 1'].toString().toLowerCase());
//       }
//     });
//
//     this.sortColumnIndex.value = sortColumnIndex;
//   }
//
//   void searchQuery(String query) {
//     filteredDataList.assignAll(dataList
//         .where((item) => item['column 1']!.contains(query.toLowerCase())));
//   }
// }
