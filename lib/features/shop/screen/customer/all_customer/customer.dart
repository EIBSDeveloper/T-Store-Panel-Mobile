import 'package:t_store_admin_panel/features/shop/screen/customer/all_customer/responsive_sccreen/customer_desktop.dart';
import 'package:t_store_admin_panel/features/shop/screen/customer/all_customer/responsive_sccreen/customer_mobile.dart';
import 'package:t_store_admin_panel/features/shop/screen/customer/all_customer/responsive_sccreen/customer_tablet.dart';

import '../../../../../utils/constants/path_provider.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CustomerDesktopScreen(),
      tablet: CustomerTabletScreen(),
      mobile: CustomerMobileScreen(),
    );
  }
}
