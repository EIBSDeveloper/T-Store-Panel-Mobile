import 'package:t_store_admin_panel/common/widgets/layouts/headers/header.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';

import '../../../../utils/constants/path_provider.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: TSideBar()),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  /// --- Header
                  THeader(),

                  ///--- Body
                  Expanded(child: body ?? const SizedBox())
                ],
              ))
        ],
      ),
    );
  }
}
