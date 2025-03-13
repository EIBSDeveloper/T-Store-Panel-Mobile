import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:t_store_admin_panel/features/shop/model/category_model.dart';

import '../../../../../../utils/constants/path_provider.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories", style: textTheme.headlineSmall),
          SizedBox(height: TSizes.spaceBtwItems),
          MultiSelectDialogField(
            buttonText: const Text('Select Categories'),
            title: const Text('Categories'),
            items: [
              MultiSelectItem(
                  CategoryModel(id: 'id', name: 'Shoes', image: 'image'),
                  'Shoes'),
              MultiSelectItem(
                  CategoryModel(id: 'id', name: 'Shirts', image: 'image'),
                  'Shirts'),
            ],
            onConfirm: (values) {},
            listType: MultiSelectListType.CHIP,
          )
        ],
      ),
    );
  }
}
