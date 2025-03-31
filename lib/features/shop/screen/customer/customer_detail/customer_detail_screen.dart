import 'package:t_store_admin_panel/features/shop/screen/customer/customer_detail/responsive_sccreen/customer_detail_desktop.dart';

import '../../../../../utils/constants/path_provider.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final customer = Get.arguments;
    return TSiteTemplate(
      desktop: CustomerDetailDesktopScreen(/*customer: customer*/),
      // mobile: CustomerDetailMobileScreen(customer: customer),
      // tablet: CustomerDetailTabletScreen(customer: customer),
    );
  }
}
