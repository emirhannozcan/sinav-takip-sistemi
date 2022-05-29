import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/charts/single_chart.dart';
import 'package:flutter_application_1/week1/dal/dbhelper.dart';
import 'package:flutter_application_1/week1/exam/update_exam.dart';
import '../models/sinav.dart';

class ExamList extends StatefulWidget {
  const ExamList({Key? key}) : super(key: key);

  @override
  _ExamListState createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  final DbHelper _dbHelper = DbHelper();
  List<Sinav>? sinavList;
  late int? sinavId;

  void getExams() async {
    var notesFuture = _dbHelper.getAllExams();
    await notesFuture.then((data) {
      setState(() {
        sinavList = data;
      });
    });
  }

  @override
  void initState() {
    getExams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sınav Listesi"),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: sinavList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      leading: const Icon(Icons.pending_actions),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleChart(sinavList![index])),
                        );
                      },
                      title: Text(sinavList![index].sinavAd),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateExam(sinavList![index])))
                                    .then((value) => setState(() {
                                          getExams();
                                        }));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () async {
                                _deleteExam(sinavList![index].id!);
                              },
                              icon: const Icon(Icons.delete, color: Colors.red))
                        ],
                      ),
                    ));
                  }))
        ])));
  }

  void _deleteExam(int deletedNoteId) async {
    await _dbHelper.delete(deletedNoteId);
    setState(() {
      getExams();
    });
  }
}
