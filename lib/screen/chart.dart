import 'package:amumal_app/global/data.dart';
import 'package:amumal_app/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:amumal_app/model/amumal_data.dart';
import 'package:amumal_app/widget/detail.dart';
import 'package:amumal_app/widget/detail_with_header.dart';

class Chart extends StatefulWidget {
  Chart({this.appData});

  final Data appData;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  initState() {
    super.initState();
  }

  @override
  int dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.appData.chart(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    color: const Color(0xff2c4260),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 100.0,
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipBottomMargin: 8,
                            getTooltipItem: (
                              BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex,
                            ) {
                              return BarTooltipItem(
                                rod.y.round().toString(),
                                TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            textStyle: TextStyle(
                                color: const Color(0xff7589a2),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            margin: 20,
                            getTitles: (double value) {
                              return snapshot.data[value.toInt()]['date'];
                            },
                          ),
                          leftTitles: const SideTitles(showTitles: false),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: List.from(snapshot.data).map((e) {
                          return BarChartGroupData(x: index++, barRods: [
                            BarChartRodData(
                                y: double.parse(e['cnt'].toString()),
                                color: Colors.lightBlueAccent)
                          ], showingTooltipIndicators: [
                            0
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar:
                  NavigationBar(location: 1, appData: widget.appData),
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot);
          return Text('error...');
        }
        return Text('loading...');
      },
    );
  }
}
