import '../../../utils/constants/path_provider.dart';

class TTableHeader extends StatelessWidget {
  const TTableHeader(
      {super.key,
      this.onPressed,
      required this.buttonText,
      this.searchController,
      this.searchOnChanged});

  final Function()? onPressed;
  final String buttonText;
  final TextEditingController? searchController;
  final Function(String)? searchOnChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: TDeviceUtils.isDesktopScreen(context) ? 3 : 1,
          child: Row(
            children: [
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: onPressed, child: Text(buttonText)),
              ),
            ],
          ),
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          flex: TDeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            controller: searchController,
            onChanged: searchOnChanged,
            decoration: InputDecoration(
                hintText: 'Search here...',
                prefixIcon: Icon(Iconsax.search_normal)),
          ),
        )
      ],
    );
  }
}
