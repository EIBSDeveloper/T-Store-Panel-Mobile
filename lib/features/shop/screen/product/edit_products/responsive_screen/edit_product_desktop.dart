import '../../../../../../utils/constants/path_provider.dart';
import '../widget/additional_images.dart';
import '../widget/attributes_widgets.dart';
import '../widget/bottom_navigation_widget.dart';
import '../widget/brand_widget.dart';
import '../widget/categories_widget.dart';
import '../widget/product_type_widget.dart';
import '../widget/stock_pricing_widget.dart';
import '../widget/thumbnail_widget.dart';
import '../widget/title_description.dart';
import '../widget/variations_widget.dart';
import '../widget/visibility_widget.dart';

class EditProductDesktopScreen extends StatelessWidget {
  const EditProductDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ProductBottomNavigationWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TBreadcrumbWithHeadings(
                  headings: 'Update Product',
                  returnToPreviousScreen: true,
                  breadcrumbItems: [TRoutes.products, TRoutes.createProducts]),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: TDeviceUtils.isTabletScreen(context) ? 2 : 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// --- Basic Information
                          ProductTitleAndDescription(),
                          SizedBox(height: TSizes.spaceBtwSections),
                          TRoundedContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// - Heading
                                Text(
                                  "Stock & Pricing",
                                  style: textTheme.headlineSmall,
                                ),
                                const SizedBox(height: TSizes.spaceBtwItems),

                                /// --- Product Type
                                ProductTypeWidget(),
                                const SizedBox(
                                    height: TSizes.spaceBtwInputFields),

                                /// --- Stock
                                ProductStockAndPricing(),
                                const SizedBox(height: TSizes.spaceBtwSections),

                                /// -- Attributes
                                ProductAttributes(),
                                const SizedBox(height: TSizes.spaceBtwSections),
                              ],
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwSections),
                          ProductVariation(),
                        ],
                      )),
                  SizedBox(width: TSizes.defaultSpace),
                  Expanded(
                      child: TRoundedContainer(
                    child: Column(
                      children: [
                        ProductThumbnailImage(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("All Product Image",
                                  style: textTheme.headlineSmall),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              ProductAdditionalImage(
                                additionalProductImagesURLs:
                                    RxList<String>.empty(),
                                onTapToAddImages: () {},
                                onTapToRemoveImage: (index) {},
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        ProductBrand(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        ProductCategories(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        ProductVisibilityWidget()
                      ],
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
