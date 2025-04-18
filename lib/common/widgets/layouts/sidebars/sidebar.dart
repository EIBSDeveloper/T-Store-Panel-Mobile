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
                        itemName: 'Dashboard'),
                    TMenuItem(
                        route: TRoutes.media,
                        icon: Iconsax.image,
                        itemName: 'Media'),
                    TMenuItem(
                        route: TRoutes.categories,
                        icon: Iconsax.category_2,
                        itemName: 'Categories'),
                    TMenuItem(
                        route: TRoutes.brands,
                        icon: Iconsax.dcube,
                        itemName: 'Brands'),
                    TMenuItem(
                        route: TRoutes.banners,
                        icon: Iconsax.picture_frame,
                        itemName: 'Banners'),
                    TMenuItem(
                        route: TRoutes.products,
                        icon: Iconsax.shopping_bag,
                        itemName: 'Product'),
                    TMenuItem(
                        route: TRoutes.customer,
                        icon: Iconsax.profile_2user,
                        itemName: 'Customer'),
                    TMenuItem(
                        route: 'logout',
                        icon: Iconsax.logout,
                        itemName: 'Logout'),
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
