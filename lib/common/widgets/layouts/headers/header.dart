import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/common/widgets/shimmers/shimmer.dart';
import 'package:t_store_admin_panel/features/authentication/controller/user_controller.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../utils/constants/path_provider.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final networkController = Get.put(NetworkManager());
    final controller = UserController.instance;
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
              Obx(
                () => TRoundedImage(
                  width: 40,
                  height: 40,
                  padding: 2,
                  imageType: controller.user.value.profilePicture.isNotEmpty
                      ? ImageType.network
                      : ImageType.asset,
                  image: controller.user.value.profilePicture.isNotEmpty
                      ? controller.user.value.profilePicture
                      : TImages.user,
                ),
              ),
              SizedBox(width: TSizes.sm),
              if (!TDeviceUtils.isMobileScreen(context))
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.isLoading.value
                          ? TShimmerEffect(width: 50, height: 13)
                          : Text(
                              controller.user.value.fullname,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                      controller.isLoading.value
                          ? TShimmerEffect(width: 50, height: 13)
                          : Text(
                              controller.user.value.email ?? '',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                    ],
                  ),
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
