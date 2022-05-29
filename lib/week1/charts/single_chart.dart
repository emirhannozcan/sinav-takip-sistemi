import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../models/lesson_stats.dart';
import '../models/sinav.dart';

class SingleChart extends StatefulWidget {
  late Sinav sinav;
  SingleChart(this.sinav, {Key? key}) : super(key: key);

  @override
  State<SingleChart> createState() => _SingleChartState(sinav);
}

class _SingleChartState extends State<SingleChart> {
  late Sinav sinav;
  late List<charts.Series> lessonList;
  _SingleChartState(this.sinav);

  @override
  void initState() {
    lessonList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(sinav.sinavAd,
                  style: Theme.of(context).primaryTextTheme.headline5)
            ],
          ),
        ),
        body: Container(
          color: const Color(0xFFEFEFEF),
          child: charts.BarChart(
            lessonList = _fillData(),
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
          ),
        ));
  }

  List<charts.Series<LessonStats, String>> _fillData() {
    final correctData = [
      LessonStats('Matematik', sinav.matD),
      LessonStats('Türkçe', sinav.turD),
      LessonStats('Fen Bilgisi', sinav.fenD),
      LessonStats('Sosyal', sinav.sosD),
    ];

    final wrongData = [
      LessonStats('Matematik', sinav.matY),
      LessonStats('Türkçe', sinav.turY),
      LessonStats('Fen Bilgisi', sinav.fenY),
      LessonStats('Sosyal', sinav.sosY),
    ];

    final emptyData = [
      LessonStats('Matematik', sinav.matB),
      LessonStats('Türkçe', sinav.turB),
      LessonStats('Fen Bilgisi', sinav.fenB),
      LessonStats('Sosyal', sinav.sosB),
    ];

    return [
      charts.Series<LessonStats, String>(
          id: 'correct',
          domainFn: (LessonStats lesson, _) => lesson.sinavAd,
          measureFn: (LessonStats lesson, _) => lesson.number,
          data: correctData,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault),
      charts.Series<LessonStats, String>(
          id: 'wrong',
          domainFn: (LessonStats lesson, _) => lesson.sinavAd,
          measureFn: (LessonStats lesson, _) => lesson.number,
          data: wrongData,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
      charts.Series<LessonStats, String>(
          id: 'empty',
          domainFn: (LessonStats lesson, _) => lesson.sinavAd,
          measureFn: (LessonStats lesson, _) => lesson.number,
          data: emptyData,
          colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault),
    ];
  }
}
