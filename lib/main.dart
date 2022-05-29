import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/exam/add_exam.dart';
import 'package:flutter_application_1/week1/home/home_view.dart';

import 'week1/charts/multiple_charts.dart';
import 'week1/examlist/examlist.dart';
import 'week1/motivation/motivation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeView(),
      routes: {
        'AddExam': (context) => AddExam(),
        'Motivation': (context) => Motivation(),
        'MultipleChart': (context) => MultipleChart(),
        'ExamList': (context) => ExamList(),
      },
    );
  }
}
