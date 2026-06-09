import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../core/utils/theme/theme_extensions.dart';

class EarningsView extends StatefulWidget {
  const EarningsView({super.key});

  @override
  State<EarningsView> createState() => _EarningsViewState();
}

class _EarningsViewState extends State<EarningsView> {
  Text chartTitleTextStyle(String text) {
    return Text(
      text,
      style: context.textTheme.bodySmall?.copyWith(
        color: context.theme.colorScheme.onSurfaceVariant,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56, left: 32, right: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Column(
                  spacing: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'THIS MONTH',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$2,486.50",
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: context.theme.colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        children: <WidgetSpan>[
                          WidgetSpan(
                            child: Icon(
                              PhosphorIcons.trendUp,
                              color: context.appColors.successColor,
                            ),
                          ),
                          WidgetSpan(
                            child: Text(
                              '+96 in February',
                              style: context.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.appColors.successColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  // color: context.theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: context.theme.colorScheme.outlineVariant,
                    width: 0.8,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 2,
                        children: [
                          Text(
                            'JOBS DONE',
                            style: context.theme.textTheme.bodySmall,
                          ),
                          Text(
                            '24',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        color: context.theme.colorScheme.outlineVariant,
                      ),
                      Column(
                        spacing: 2,
                        children: [
                          Text(
                            'AVG / JOB',
                            style: context.theme.textTheme.bodySmall,
                          ),
                          Text(
                            '\$103.60',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        color: context.theme.colorScheme.outlineVariant,
                      ),
                      Column(
                        spacing: 2,
                        children: [
                          Text(
                            'HOURS',
                            style: context.theme.textTheme.bodySmall,
                          ),
                          Text(
                            '62.5',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            Container(
              height: 350,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: BarChart(
                key: UniqueKey(),
                BarChartData(
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (val) {
                      return FlLine(
                        color: Colors.grey.shade400,
                        strokeWidth: 1.0,
                      );
                    },
                  ),
                  maxY: 500,
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (val, metadata) {
                          switch (val.toInt()) {
                            case 0:
                              return chartTitleTextStyle("Sun");
                            case 1:
                              return chartTitleTextStyle("Mon");
                            case 2:
                              return chartTitleTextStyle("Tue");
                            case 3:
                              return chartTitleTextStyle("Web");
                            case 4:
                              return chartTitleTextStyle("Thu");
                            case 5:
                              return chartTitleTextStyle("Fri");
                            default:
                              return chartTitleTextStyle("Sat");
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 100,
                        reservedSize: 30,
                        getTitlesWidget: (val, metaData) {
                          return chartTitleTextStyle("${val.toInt()}");
                        },
                      ),
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 150,
                          width: 30,
                          color: context.theme.colorScheme.onSecondaryContainer,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 170,
                          width: 30,
                          color: context.theme.colorScheme.onSecondaryContainer,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 90,
                          width: 30,
                          color: context.theme.colorScheme.onSecondaryContainer,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: 189,
                          width: 30,
                          color: context.theme.colorScheme.onSecondaryContainer,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(
                          toY: 350,
                          width: 30,
                          color: context.theme.colorScheme.onSecondaryContainer,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [
                        BarChartRodData(
                          toY: 120,
                          width: 30,
                          color: context.theme.colorScheme.onSecondaryContainer,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 6,
                      barRods: [
                        BarChartRodData(
                          toY: 160,
                          width: 30,
                          color: context.theme.colorScheme.onSecondaryContainer,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Payouts',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: context.appColors.successColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: context.appColors.successColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.appColors.successColor.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    PhosphorIcons.arrowDownRight,
                    color: context.appColors.successColor,
                  ),
                ),
              ),
              title: Text(
                "Maya Reinhardt",
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.colorScheme.secondary,
                ),
              ),
              subtitle: Text(
                "Mar 12 . Deep Clean",
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.outlineVariant,
                ),
              ),
              trailing: Text(
                "+\$140",
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.appColors.successColor,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.appColors.successColor.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    PhosphorIcons.arrowDownRight,
                    color: context.appColors.successColor,
                  ),
                ),
              ),
              title: Text(
                "Maya Reinhardt",
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.colorScheme.secondary,
                ),
              ),
              subtitle: Text(
                "Mar 12 . Deep Clean",
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.outlineVariant,
                ),
              ),
              trailing: Text(
                "+\$140",
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.appColors.successColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
