import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:t_store_admin_panel/features/shop/screen/customer/customer_detail/table/table_source.dart';

import '../../../../../../utils/constants/path_provider.dart';

class CustomerOrderTable extends StatelessWidget {
  const CustomerOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
      minWidth: 550,
      tableHeight: 640,
      dataRowHeight: 48,
      columns: [
        DataColumn2(label: Text('Order Id')),
        DataColumn2(label: Text('Date')),
        DataColumn2(label: Text('Items')),
        DataColumn2(
            label: Text('Status'),
            fixedWidth: TDeviceUtils.isMobileScreen(context) ? 100 : null),
        DataColumn2(label: Text('Amount'), numeric: true),
      ],
      source: CustomerOrderRows(),
    );
  }
}
