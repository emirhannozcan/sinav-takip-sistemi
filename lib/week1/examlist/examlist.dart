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

  // final _formKey = GlobalKey<FormState>();
  late int? sinavId;
  // final _sinavAdController = TextEditingController();
  // final _fenBController = TextEditingController();
  // final _fenDController = TextEditingController();
  // final _fenYController = TextEditingController();
  // final _matBController = TextEditingController();
  // final _matDController = TextEditingController();
  // final _matYController = TextEditingController();
  // final _sosBController = TextEditingController();
  // final _sosDController = TextEditingController();
  // final _sosYController = TextEditingController();
  // final _turBController = TextEditingController();
  // final _turDController = TextEditingController();
  // final _turYController = TextEditingController();

  void getExams() async {
    var notesFuture = _dbHelper.getAllExams();
    await notesFuture.then((data) {
      setState(() {
        sinavList = data;
        print("girdi");
      });
    });
  }

  @override
  void initState() {
    print("initState");
    getExams();
    super.initState();
  }

  // @override
  //   void setState() {
  //     resultCities=filteredCities;
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sınav Listesi"),
        ),
        body: Container(
            child: Column(children: <Widget>[
          // Form(
          //     key: _formKey,
          //     child: Column(children: <Widget>[
          //       buildForm(_sinavAdController, "Sınav Ad"),
          //     ])),
          Expanded(
              child: ListView.builder(
                  itemCount: sinavList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      leading: Icon(Icons.pending_actions),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleChart(sinavList![index])),
                        );
                        //güncelleme kısmı burada olacak
                        // UpdateExam(sinavList![index].id!)),
                        // .then((value) => setState(() {}));
                        // Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 UpdateExam(sinavList![index])))
                        //     .then((value) => setState(() {
                        //           getExams();
                        //         }));

                        //single_chart burada kullanılacak
                      },
                      title: Text(sinavList![index].sinavAd),
                      // subtitle: Text(sinavList[index].description),
                      // trailing: GestureDetector(
                      //   onTap: () {
                      //     _deleteExam(sinavList![index].id!);
                      //   },
                      //   child: Icon(Icons.delete),
                      // )
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateExam(
                                            sinavList![index]))).then((value) =>
                                    setState(() {
                                      getExams();
                                    })); //navigate to edit page, pass student roll no to edit
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () async {
                                _deleteExam(sinavList![index].id!);
                              },
                              icon: Icon(Icons.delete, color: Colors.red))
                        ],
                      ),
                    ));
                  }))
        ])));
  }

  // Widget buildForm(TextEditingController txtController, String str) {
  //   return Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: TextFormField(
  //           autofocus: false,
  //           controller: txtController,
  //           decoration:
  //               InputDecoration(labelText: str, border: OutlineInputBorder())));
  // }

  void _deleteExam(int deletedNoteId) async {
    await _dbHelper.delete(deletedNoteId);

    setState(() {
      getExams();
    });
  }
}
