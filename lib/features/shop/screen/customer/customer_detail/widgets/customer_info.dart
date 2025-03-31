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
              Expanded(child: Text("Karthick", style: textTheme.titleMedium))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              SizedBox(width: 120, child: Text("Country")),
              Text(":"),
              SizedBox(width: TSizes.spaceBtwItems / 2),
              Expanded(child: Text("India", style: textTheme.titleMedium))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              SizedBox(width: 120, child: Text("Phone Number")),
              Text(":"),
              SizedBox(width: TSizes.spaceBtwItems / 2),
              Expanded(
                  child: Text(
                "7094930770",
                style: textTheme.titleMedium,
              ))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Divider(),
          SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Last Order", style: textTheme.titleLarge),
                  Text("7 Days ago, #[36d41]")
                ],
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Avg Order Value", style: textTheme.titleLarge),
                  Text("₹ 1500")
                ],
              )),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Registered", style: textTheme.titleLarge),
                  Text("31-03-2025 at 04:55 PM")
                ],
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email Marketing", style: textTheme.titleLarge),
                  Text("Subscribed")
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
