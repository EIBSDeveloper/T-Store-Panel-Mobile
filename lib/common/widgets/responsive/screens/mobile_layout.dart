import 'package:t_store_admin_panel/common/widgets/layouts/headers/header.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';

import '../../../../utils/constants/path_provider.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
