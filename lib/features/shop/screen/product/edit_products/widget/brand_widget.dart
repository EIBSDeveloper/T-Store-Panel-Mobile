import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:t_store_admin_panel/features/shop/model/brand_model.dart';

import '../../../../../../utils/constants/path_provider.dart';

class ProductBrand extends StatelessWidget {
  const ProductBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Brand", style: textTheme.headlineSmall),
          SizedBox(height: TSizes.spaceBtwItems),
          TypeAheadField(
            builder: (context, ctrl, focusNode) {
              return TextFormField(
                focusNode: focusNode,
                decoration: InputDecoration(
                    labelText: 'Select Brand', suffixIcon: Icon(Iconsax.box)),
              );
            },
            suggestionsCallback: (pattern) {
              return [
                BrandModel(
                    id: 'id', image: TImages.darkAppLogo, name: "S-Store"),
                BrandModel(
                    id: 'id', image: TImages.darkAppLogo, name: "T-Store"),
              ];
            },
            itemBuilder: (context, suggestion) {
              return ListTile(title: Text(suggestion.name));
            },
            onSelected: (suggestion) {},
          )
        ],
      ),
    );
  }
}
