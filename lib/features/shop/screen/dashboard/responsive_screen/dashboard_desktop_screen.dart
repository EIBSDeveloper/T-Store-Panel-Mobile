import 'package:data_table_2/data_table_2.dart';

import '../../../../../utils/constants/path_provider.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Obx(
            () => Theme(
              data: Theme.of(context)
                  .copyWith(cardTheme: CardTheme(color: Colors.white)),
              child: PaginatedDataTable2(
                columnSpacing: 12,
                minWidth: 786,
                dividerThickness: 0,
                horizontalMargin: 12,
                dataRowHeight: 56,
                headingTextStyle: Theme.of(context).textTheme.titleMedium,
                headingRowColor: WidgetStateProperty.resolveWith(
                    (states) => TColors.primaryBackground),
                headingRowDecoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(TSizes.borderRadiusMd),
                        topLeft: Radius.circular(TSizes.borderRadiusMd))),

                /// -- Pagination
                showFirstLastButtons: true,
                onPageChanged: (value) {},
                renderEmptyRowsInTheEnd: true,
                onRowsPerPageChanged: (noOfRows) {},

                /// - Sorting
                sortAscending: true,
                sortArrowAlwaysVisible: true,

                /// -- show check box
                showCheckboxColumn: true,
                columns: [
                  DataColumn2(label: Text("Column 1")),
                  DataColumn2(label: Text("Column 2")),
                  DataColumn2(label: Text("Column 3")),
                  DataColumn2(label: Text("Column 4")),
                ],
                source: MyData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final controller = Get.put(DashboardController());

  @override
  DataRow? getRow(int index) {
    final data = controller.dataList[index];

    return DataRow2(
        onTap: () {
          print("Row :${index + 1} is clicked");
        },
        selected: controller.selectedRow[index],
        onSelectChanged: (value) =>
            controller.selectedRow[index] = value ?? false,
        cells: [
          DataCell(
            Text(data['column 1'] ?? ''),
          ),
          DataCell(
            Text(data['column 2'] ?? ''),
          ),
          DataCell(
            Text(data['column 3'] ?? ''),
          ),
          DataCell(
            Text(data['column 4'] ?? ''),
          ),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.dataList.length;

  @override
  int get selectedRowCount => 0;
}

class DashboardController extends GetxController {
  var dataList = <Map<String, dynamic>>[].obs;

  RxList<bool> selectedRow = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void fetchDummyData() {
    selectedRow.assignAll(List.generate(36, (index) => false));
    dataList.addAll(List.generate(
        36,
        (index) => {
              'column 1': 'Data ${index + 1} - 1',
              'column 2': 'Data ${index + 1} - 2',
              'column 3': 'Data ${index + 1} - 3',
              'column 4': 'Data ${index + 1} - 4',
            }));
  }
}
