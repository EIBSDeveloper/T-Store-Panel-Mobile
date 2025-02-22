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
      drawer: Drawer(),
      body: body ?? SizedBox(),
    );
  }
}
