import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlySpendingChart extends StatelessWidget {
  const MonthlySpendingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns the title to the start
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 0.0), 
          // Adds padding to the left of the title
          child: Text(
            'Monthly Spending',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15), // Adds some space between the title and the chart
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(0.0), // Adds padding around the chart
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 700,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const style = TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        );
                        Widget text;

                        switch (value.toInt()) {
                          case 0:
                            text = const Text('JAN ', style: style);
                            break;
                          case 1:
                            text = const Text('FEB', style: style);
                            break;
                          case 2:
                            text = const Text('MAR', style: style);
                            break;
                          case 3:
                            text = const Text('APR', style: style);
                            break;
                          case 4:
                            text = const Text('MAY', style: style);
                            break;
                          case 5:
                            text = const Text('JUN', style: style);
                            break;
                          default:
                            text = const Text('');
                            break;
                        }

                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 4.0, // Provide some space between the titles and the bars
                          child: text,
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true, // Show the labels on the left side
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const style = TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        );
                        return Text('${value.toInt()}', style: style);
                      },
                      interval: 100,
                      reservedSize: 28,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false, // Hide the top axis labels
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false, // Hide the labels on the right side
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: _buildBarGroups(),
                gridData: FlGridData(
                  show: true, // Show the grid lines
                  drawVerticalLine: false, // Optional: Hide vertical lines if you only want horizontal ones
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.5), // Color of the horizontal grid lines
                      strokeWidth: 0.5, // Thickness of the lines
                    );
                  },
                  horizontalInterval: 100, // Spacing between the horizontal lines
                  checkToShowHorizontalLine: (value) {
                    return value % 100 == 0; // Only show lines at intervals of 100 (0, 100, 200, ..., 600)
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return [
      _buildBarGroup(0, 300),
      _buildBarGroup(1, 500),
      _buildBarGroup(2, 250),
      _buildBarGroup(3, 350),
      _buildBarGroup(4, 550),
      _buildBarGroup(5, 400),
    ];
  }

  BarChartGroupData _buildBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 22,
          borderRadius: BorderRadius.circular(0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 144, 197, 241).withOpacity(0.8),
              const Color.fromARGB(255, 235, 158, 184).withOpacity(0.8),
            ],
          ),
        ),
      ],
    );
  }
}
