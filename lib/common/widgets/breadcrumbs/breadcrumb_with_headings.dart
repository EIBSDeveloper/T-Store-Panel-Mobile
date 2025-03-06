import 'package:t_store_admin_panel/common/widgets/texts/page_heading.dart';

import '../../../utils/constants/path_provider.dart';

class TBreadcrumbWithHeadings extends StatelessWidget {
  const TBreadcrumbWithHeadings(
      {super.key,
      required this.headings,
      required this.breadcrumbItems,
      this.returnToPreviousScreen = false});

  // heading for the page
  final String headings;

  // list of breadcrumb items representing the navigate path
  final List<String> breadcrumbItems;

  //Flag indicating weather to include a button to return to previous screen;
  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => Get.offAllNamed(TRoutes.dashboard),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.xs),
                child: Text(
                  'Dashboard',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(fontWeightDelta: -1),
                ),
              ),
            ),
            for (int i = 0; i < breadcrumbItems.length; i++)
              Row(
                children: [
                  Text('/'),
                  InkWell(
                    onTap: i == breadcrumbItems.length - 1
                        ? null
                        : () => Get.toNamed(breadcrumbItems[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.xs),
                      child: Text(
                        i == breadcrumbItems.length
                            ? breadcrumbItems[i].capitalize.toString()
                            : capitalize(breadcrumbItems[i].substring(1)),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(fontWeightDelta: -1),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
        SizedBox(height: TSizes.sm),
        Row(
          children: [
            if (returnToPreviousScreen)
              IconButton(
                  onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left)),
            if (returnToPreviousScreen) SizedBox(width: TSizes.spaceBtwItems),
            TPageHeading(heading: headings)
          ],
        )
      ],
    );
  }

  String capitalize(String s) {
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}
