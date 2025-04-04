import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/paginated_data_table.dart';

import '../../../../../../utils/constants/path_provider.dart';
import 'table_source.dart';

class CustomerTable extends StatelessWidget {
  const CustomerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
        minWidth: 700,
        columns: [
          DataColumn2(label: Text("Customer")),
          DataColumn2(label: Text("Email")),
          DataColumn2(label: Text("Phone Number")),
          DataColumn2(label: Text("Registered")),
          DataColumn2(label: Text("Action"), fixedWidth: 100),
        ],
        source: CustomerRows());
  }
}
