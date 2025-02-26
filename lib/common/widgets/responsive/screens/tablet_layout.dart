import 'package:t_store_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';

import '../../../../utils/constants/path_provider.dart';
import '../../layouts/headers/header.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: THeader(scaffoldKey: scaffoldKey),
      drawer: TSideBar(),
      body: body ?? SizedBox(),
    );
  }
}
