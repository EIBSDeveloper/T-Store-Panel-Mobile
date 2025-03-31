import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';

import '../../../../../../utils/constants/path_provider.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer Information", style: textTheme.headlineMedium),
          SizedBox(height: TSizes.spaceBtwSections),
          Row(
            children: [
              TRoundedImage(
                padding: 0,
                imageType: ImageType.asset,
                backgroundColor: TColors.primaryBackground,
                image: TImages.user,
              ),
              SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Karthick Dinesh",
                    style: textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "Karthick@gmail.com",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          Row(
            children: [
              SizedBox(width: 120, child: Text("UserName")),
              Text(":"),
              SizedBox(width: TSizes.spaceBtwItems / 2),
              Text("Karthick")
            ],
          )
        ],
      ),
    );
  }
}
