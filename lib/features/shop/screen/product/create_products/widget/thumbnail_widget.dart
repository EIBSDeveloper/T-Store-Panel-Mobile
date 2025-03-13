import '../../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../../utils/constants/path_provider.dart';

class ProductThumbnailImage extends StatelessWidget {
  const ProductThumbnailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Thumbnail", style: textTheme.headlineSmall),
          SizedBox(height: TSizes.spaceBtwItems),

          /// Container for Product Thumbnail
          TRoundedContainer(
              height: 300,
              backgroundColor: TColors.primaryBackground,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Thumbnail Image
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: TRoundedImage(
                                width: 220,
                                height: 220,
                                image: TImages.defaultSingleImageIcon,
                                imageType: ImageType.asset)), // Expanded
                      ],
                    ), // Row
                    /// Add Thumbnail Button
                    SizedBox(
                        width: 200,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Add Thumbnail')))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
