import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/dal/dbhelper.dart';

import '../models/sinav.dart';

class ExamList extends StatefulWidget {
  const ExamList({Key? key}) : super(key: key);

  @override
  _ExamListState createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  final DbHelper _dbHelper = DbHelper();
  List<Sinav>? sinavList;

  final _formKey = GlobalKey<FormState>();
  late int? sinavId;
  final _sinavAdController = TextEditingController();
  final _fenBController = TextEditingController();
  final _fenDController = TextEditingController();
  final _fenYController = TextEditingController();
  final _matBController = TextEditingController();
  final _matDController = TextEditingController();
  final _matYController = TextEditingController();
  final _sosBController = TextEditingController();
  final _sosDController = TextEditingController();
  final _sosYController = TextEditingController();
  final _turBController = TextEditingController();
  final _turDController = TextEditingController();
  final _turYController = TextEditingController();

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
    super.initState();
    getExams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sınav Listesi"),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                buildForm(_sinavAdController, "Sınav Ad"),
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: sinavList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            onTap: () {
                              setState(() {
                                _sinavAdController.text =
                                    sinavList![index].sinavAd;
                                // _controllerDesc.text = allNotes[index].description;
                                sinavId = sinavList![index].id;
                              });
                            },
                            title: Text(sinavList![index].sinavAd),
                            // subtitle: Text(sinavList[index].description),
                            trailing: GestureDetector(
                              onTap: () {
                                // _deleteNote(allNotes[index].id, index);
                              },
                              child: Icon(Icons.delete),
                            )));
                  }))
        ])));
  }

  Widget buildForm(TextEditingController txtController, String str) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            autofocus: false,
            controller: txtController,
            decoration:
                InputDecoration(labelText: str, border: OutlineInputBorder())));
  }
}