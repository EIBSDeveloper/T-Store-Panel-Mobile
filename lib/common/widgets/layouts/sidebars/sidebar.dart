import 'package:t_store_admin_panel/common/widgets/images/t_circular_image.dart';

import '../../../../utils/constants/path_provider.dart';
import 'menu/menu_item.dart';

class TSideBar extends StatelessWidget {
  const TSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
            color: TColors.white,
            border: Border(right: BorderSide(color: TColors.grey, width: 1))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TCircularImage(
                width: 100,
                backgroundColor: Colors.transparent,
                height: 100,
                image: TImages.darkAppLogo,
              ),
              Padding(
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    Text(
                      'Menu',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    TMenuItem(
                      route: TRoutes.dashboard,
                      icon: Iconsax.status,
                      itemName: 'Dashboard',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
