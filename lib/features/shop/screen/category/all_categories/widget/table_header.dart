import '../../../../../../utils/constants/path_provider.dart';

class CategoryTableHeader extends StatelessWidget {
  const CategoryTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: TDeviceUtils.isDesktopScreen(context) ? 3 : 1,
          child: SizedBox(
            width: 300,
            child: ElevatedButton(
                onPressed: () => Get.toNamed(TRoutes.createCategories),
                child: Text("Create New Category")),
          ),
        ),
        Expanded(
          flex: TDeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Search Categories',
                prefixIcon: Icon(Iconsax.search_normal)),
          ),
        )
      ],
    );
  }
}
