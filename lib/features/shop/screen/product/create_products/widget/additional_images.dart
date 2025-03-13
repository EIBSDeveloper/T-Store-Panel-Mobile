import 'package:t_store_admin_panel/common/widgets/images/image_uploader.dart';

import '../../../../../../utils/constants/path_provider.dart';

class ProductAdditionalImage extends StatelessWidget {
  const ProductAdditionalImage(
      {super.key,
      required this.additionalProductImagesURLs,
      this.onTapToAddImages,
      this.onTapToRemoveImage});

  final RxList<String> additionalProductImagesURLs;

  final void Function()? onTapToAddImages;
  final void Function(int index)? onTapToRemoveImage;

  @override
  Widget build(BuildContext context) {
    return /*Obx(
      () => */
        SizedBox(
      height: 300,
      child: Column(children: [
        /// Section to Add Additional Product Images
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: onTapToAddImages,
            child: TRoundedContainer(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(TImages.defaultMultiImageIcon,
                        width: 50, height: 50),
                    const Text('Add Additional Product Images'),
                  ],
                ), // Column
              ), // Center
            ), // TRoundedContainer
          ), // Gesture Detector
        ),

        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 80,
                  child: _uploadImagesOrEmptyList(),
                ),
              ),
              SizedBox(width: TSizes.spaceBtwItems / 2),
              TRoundedContainer(
                width: 80,
                height: 80,
                showBorder: true,
                backgroundColor: TColors.white,
                borderColor: TColors.grey,
                onTap: onTapToAddImages,
                child: Center(
                  child: Icon(Iconsax.add),
                ),
              )
            ],
          ),
        )
      ]),
      // ),
    );
  }

  Widget _uploadImagesOrEmptyList() {
    // return additionalProductImagesURLs.isNotEmpty
    //     ? _uploadImages()
    //     : emptyList();
    return emptyList();
  }

  Widget _uploadImages() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      separatorBuilder: (context, index) =>
          SizedBox(width: TSizes.spaceBtwItems / 2),
      itemBuilder: (_, index) {
        final image = additionalProductImagesURLs[index];
        return TImageUploader(
          width: 80,
          height: 80,
          top: 0,
          right: 0,
          left: null,
          bottom: null,
          image: image,
          icon: Iconsax.trash,
          imageType: ImageType.network,
          onIconButtonPressed: () => onTapToRemoveImage!(index),
        );
      },
    );
  }

  Widget emptyList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      separatorBuilder: (context, index) =>
          SizedBox(width: TSizes.spaceBtwItems / 2),
      itemBuilder: (_, index) => TRoundedContainer(
        width: 80,
        height: 80,
        backgroundColor: TColors.primaryBackground,
      ),
    );
  }
}
