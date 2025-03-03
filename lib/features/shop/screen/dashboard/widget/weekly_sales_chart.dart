import 'package:fl_chart/fl_chart.dart';

import '../../../../../utils/constants/path_provider.dart';
import '../../../controller/dashboard/dashboard_controller.dart';

class TWeeklySalesGraph extends StatelessWidget {
  const TWeeklySalesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Weekly Sales",
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            height: 400,
            child: BarChart(
              BarChartData(
                  titlesData: buildFlTitleData(),
                  borderData: FlBorderData(
                      show: true,
                      border:
                          Border(top: BorderSide.none, right: BorderSide.none)),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    horizontalInterval: 100,
                  ),
                  barGroups: controller.weeklySales
                      .asMap()
                      .entries
                      .map((entry) => BarChartGroupData(x: entry.key, barRods: [
                            BarChartRodData(
                                width: 30,
                                color: TColors.primary,
                                borderRadius: BorderRadius.circular(TSizes.sm),
                                toY: entry.value)
                          ]))
                      .toList(),
                  groupsSpace: TSizes.spaceBtwItems,
                  barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (_) => TColors.accent,
                      ),
                      touchCallback: TDeviceUtils.isDesktopScreen(context)
                          ? (barTouchEvent, barTouchResponse) {}
                          : null)),
            ),
          )
        ],
      ),
    );
  }

  FlTitlesData buildFlTitleData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

              final index = value.toInt() % days.length;
              final day = days[index];

              return SideTitleWidget(
                  space: 0, axisSide: AxisSide.bottom, child: Text(day));
            }),
      ),
      leftTitles: AxisTitles(
          sideTitles:
              SideTitles(showTitles: true, interval: 200, reservedSize: 50)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}
