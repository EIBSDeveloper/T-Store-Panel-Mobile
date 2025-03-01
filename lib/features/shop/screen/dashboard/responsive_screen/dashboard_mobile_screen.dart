import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/path_provider.dart';
import '../widget/dashboard_card.dart';
import '../widget/order_status_pie_graph.dart';
import '../widget/weekly_sales_chart.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Header
              Text("Dashboard",
                  style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Card
              TDashboardCard(
                  title: 'Sales Total', stats: 25, subTitle: '₹36545.6'),
              SizedBox(height: TSizes.spaceBtwItems),
              TDashboardCard(
                  title: 'Average Order Value', stats: 15, subTitle: '2051.6'),
              SizedBox(height: TSizes.spaceBtwItems),
              TDashboardCard(title: 'Total Orders', stats: 44, subTitle: '36'),
              SizedBox(height: TSizes.spaceBtwItems),
              TDashboardCard(title: 'Visitors', stats: 2, subTitle: '6501'),

              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Graph
              TWeeklySalesGraph(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --- Orders
              TRoundedContainer(),

              /// -- Pie Chart
              OrderStatusPieGraph(),
            ],
          ),
        ),
      ),
    );
  }
}
