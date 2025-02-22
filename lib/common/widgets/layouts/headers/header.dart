import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../utils/constants/path_provider.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.white,
          border: Border(bottom: BorderSide(color: TColors.grey, width: 1))),
      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        leading: !TDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                icon: Icon(Icons.menu))
            : null,
        title: TDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Iconsax.search_normal),
                      hintText: "Search Anything...",
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              )
            : null,
        actions: [
          if (!TDeviceUtils.isDesktopScreen(context))
            IconButton(onPressed: () {}, icon: Icon(Iconsax.search_normal)),
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
          SizedBox(width: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              TRoundedImage(
                imageType: ImageType.asset,
                image: TImages.user,
              ),
              SizedBox(width: TSizes.sm),
              if (!TDeviceUtils.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Karthick Dinesh",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Karthickd602@gmail.com",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                )
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
