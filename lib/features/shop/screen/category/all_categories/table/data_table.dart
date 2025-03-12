import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/paginated_data_table.dart';

import '../../../../../../utils/constants/path_provider.dart';
import 'table_source.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(columns: [
      DataColumn2(label: Text("Category")),
      DataColumn2(label: Text("Parent Category")),
      DataColumn2(label: Text("Featured")),
      DataColumn2(label: Text("Date")),
      DataColumn2(label: Text("Action"), fixedWidth: 100),
    ], source: CategoryRows());
  }
}
