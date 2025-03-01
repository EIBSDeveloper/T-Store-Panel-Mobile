import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/path_provider.dart';

class TDashboardCard extends StatelessWidget {
  const TDashboardCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.stats,
    this.icon = Iconsax.arrow_up_3,
    this.color = TColors.success,
    this.onTap,
  });

  final String title, subTitle;
  final IconData icon;
  final Color color;
  final int stats;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      onTap: onTap,
      padding: EdgeInsets.all(TSizes.lg),
      child: Column(
        children: [
          /// --- Heading
          TSectionHeading(title: title, textColor: TColors.textSecondary),
          SizedBox(height: TSizes.spaceBtwSections),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        size: TSizes.iconSm,
                        color: color,
                      ),
                      Text(
                        '$stats%',
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: color, overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 135,
                    child: Text(
                      "Compare to Feb 2025",
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
