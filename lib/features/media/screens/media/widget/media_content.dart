import 'package:t_store_admin_panel/features/media/screens/media/widget/folder_dropdown.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/path_provider.dart';
import '../../../controllers/media_controller.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Select Folder",
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(width: TSizes.spaceBtwItems),
              MediaFolderDropdown(onChanged: (MediaCategory? newValue) {
                if (newValue != null) {
                  controller.selectedPath.value = newValue;
                }
              }),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: TSizes.spaceBtwItems / 2,
            runSpacing: TSizes.spaceBtwItems / 2,
            children: [
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
              ),
            ],
          ),

          /// Load More Media Button
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: TSizes.buttonWidth,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('Load More'),
                    icon: const Icon(Iconsax.arrow_down, color: Colors.white),
                  ), // ElevatedButton.icon
                ), // SizedBox
              ],
            ), // Row
          ), // Padding
        ],
      ),
    );
  }
}
