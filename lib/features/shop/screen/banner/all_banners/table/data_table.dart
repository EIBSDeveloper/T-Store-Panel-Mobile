import 'package:data_table_2/data_table_2.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/paginated_data_table.dart';

import '../../../../../../utils/constants/path_provider.dart';
import 'table_source.dart';

class BannerTable extends StatelessWidget {
  const BannerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
        minWidth: 700,
        tableHeight: 900,
        dataRowHeight: 110,
        columns: [
          DataColumn2(label: Text("Banner")),
          DataColumn2(label: Text("Redirect Screen")),
          DataColumn2(label: Text("Active")),
          DataColumn2(label: Text("Action"), fixedWidth: 100),
        ],
        source: BannerRows());
  }
}
