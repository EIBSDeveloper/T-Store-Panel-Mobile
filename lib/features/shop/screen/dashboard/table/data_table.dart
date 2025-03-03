import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:t_store_admin_panel/features/shop/screen/dashboard/table/table_source.dart';

import '../../../../../utils/constants/path_provider.dart';

class DashboardOrderTable extends StatelessWidget {
  const DashboardOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: TSizes.xl * 1.2,
      columns: [
        DataColumn2(label: Text('Order Id')),
        DataColumn2(label: Text('Date')),
        DataColumn2(label: Text('Items')),
        DataColumn2(label: Text('Status')),
        DataColumn2(label: Text('Amount')),
      ],
      source: OrderRows(),
    );
  }
}
