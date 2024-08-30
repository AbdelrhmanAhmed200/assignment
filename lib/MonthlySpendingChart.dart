import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlySpendingChart extends StatelessWidget {
  const MonthlySpendingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 600,
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
                    const SizedBox(height: 7,);
                    break;
                  case 1:
                    text = const Text('FEB', style: style);
                    const SizedBox(height: 7,);
                    break;
                  case 2:
                    text = const Text('MAR', style: style);
                    const SizedBox(height: 7,);
                    break;
                  case 3:
                    text = const Text('APR', style: style);
                    const SizedBox(height: 7,);
                    break;
                  case 4:
                    text = const Text('MAY', style: style);
                    const SizedBox(height: 7,);
                    break;
                  case 5:
                    text = const Text('JUN', style: style);
                    const SizedBox(height: 7,);
                    break;
                  default:
                    text = const Text('');
                    break;
                }
                
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.0, // Provide some space between the titles and the bars
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
        gridData: const FlGridData(show: false),
      ),
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
