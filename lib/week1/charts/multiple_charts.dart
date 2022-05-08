import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../dal/dbhelper.dart';
import '../models/sinav.dart';

class MultipleChart extends StatefulWidget {
  const MultipleChart({Key? key}) : super(key: key);

  @override
  State<MultipleChart> createState() => _MultipleChartState();
}

class _MultipleChartState extends State<MultipleChart> {
  final DbHelper _dbHelper = DbHelper();
  late List<Sinav>? sinavList;
  final correct = List<LessonStats>.empty().toList();
  final wrong = List<LessonStats>.empty().toList();
  late TooltipBehavior _tooltipBehavior;

  void getExams() async {
    var notesFuture = _dbHelper.getAllExams();
    await notesFuture.then((data) {
      setState(() {
        sinavList = data;
        if (sinavList != null) {}
        sinavList?.forEach((element) {
          int c = element.matD + element.turD + element.fenD + element.sosD;
          int w = element.matY + element.turY + element.fenY + element.sosY;
          String sinavAd = element.sinavAd;

          correct.add(LessonStats(sinavAd, c));
          wrong.add(LessonStats(sinavAd, w));
        });
      });
    });
  }

  @override
  void initState() {
    getExams();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gelişim", style: Theme.of(context).primaryTextTheme.headline5)
          ],
        ),
      ),
      body: SfCartesianChart(
        title: ChartTitle(text: 'Sınavlardaki toplam doğru ve yanlışlarınız'),
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<LessonStats, String>(
              color: const Color.fromARGB(255, 8, 155, 32),
              dataSource: correct,
              xValueMapper: (LessonStats ls, _) => ls.sinavAd,
              yValueMapper: (LessonStats ls, _) => ls.number,
              name: 'Doğru',
              markerSettings: const MarkerSettings(
                isVisible: true,
              )),
          LineSeries<LessonStats, String>(
              dataSource: wrong,
              color: const Color.fromARGB(255, 208, 10, 10),
              xValueMapper: (LessonStats ls, _) => ls.sinavAd,
              yValueMapper: (LessonStats ls, _) => ls.number,
              name: 'Yanlış',
              markerSettings: const MarkerSettings(
                isVisible: true,
              )),
        ],
        primaryXAxis: CategoryAxis(),
      ),
    ));
  }
}

class LessonStats {
  late String sinavAd;
  late int number;
  LessonStats(this.sinavAd, this.number);
}
