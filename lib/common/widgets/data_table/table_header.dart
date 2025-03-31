import '../../../utils/constants/path_provider.dart';

class TTableHeader extends StatelessWidget {
  const TTableHeader(
      {super.key,
      this.onPressed,
      this.buttonText = 'Add',
      this.searchController,
      this.searchOnChanged,
      this.showLeftWidget = true});

  final Function()? onPressed;
  final bool showLeftWidget;
  final String buttonText;
  final TextEditingController? searchController;
  final Function(String)? searchOnChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: TDeviceUtils.isDesktopScreen(context) ? 3 : 1,
          child: showLeftWidget
              ? Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: onPressed, child: Text(buttonText)),
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ),
        SizedBox(width: TSizes.spaceBtwItems),
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
