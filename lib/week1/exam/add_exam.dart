import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/dal/dbhelper.dart';
import '../models/sinav.dart';
import 'package:flutter/services.dart';

class AddExam extends StatefulWidget {
  const AddExam({Key? key}) : super(key: key);

  @override
  _AddExamState createState() => _AddExamState();
}

class _AddExamState extends State<AddExam> {
  final DbHelper _dbHelper = DbHelper();
  final appBarTitle = "Sınav Ekle";
  final sinavAdTitle = "Sınav Adı";
  final dogruText = "Doğru";
  final fenTitle = "Fen";
  final matematikTitle = "Matematik";
  final saveText = "Kaydet";
  final sosyalTitle = "Sosyal";
  final turkceTitle = "Türkçe";
  final yanlisText = "Yanlış";

  final int? _sinavId = null;
  final _addFormKey = GlobalKey<FormState>();
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

  void _addExam(Sinav sinav) async {
    await _dbHelper.insert(sinav);
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
            const Icon(Icons.add_box_outlined),
            Text(appBarTitle,
                style: Theme.of(context).primaryTextTheme.headline5)
          ],
        ),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text(sinavAdTitle),
                              TextFormField(
                                maxLength: 10,
                                controller: _sinavAdController,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: sinavAdTitle,
                                    hintText: sinavAdTitle,
                                    counterText: ""),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen sınav adı giriniz';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Text(matematikTitle),
                        _commonContainer(
                            _matDController, _matYController, _matBController),
                        Text(turkceTitle),
                        _commonContainer(
                            _turDController, _turYController, _turBController),
                        Text(fenTitle),
                        _commonContainer(
                            _fenDController, _fenYController, _fenBController),
                        Text(sosyalTitle),
                        _commonContainer(
                            _sosDController, _sosYController, _sosBController),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addExam(Sinav(
                                        _sinavId,
                                        _sinavAdController.text,
                                        int.parse(_matDController.text),
                                        int.parse(_matYController.text),
                                        int.parse(_matBController.text),
                                        int.parse(_turDController.text),
                                        int.parse(_turYController.text),
                                        int.parse(_turBController.text),
                                        int.parse(_fenDController.text),
                                        int.parse(_fenYController.text),
                                        int.parse(_fenBController.text),
                                        int.parse(_sosDController.text),
                                        int.parse(_sosYController.text),
                                        int.parse(_sosBController.text)));
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(saveText,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }

  Container _commonContainer(TextEditingController correct,
      TextEditingController wrong, TextEditingController empty) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        children: <Widget>[
          Flexible(
            child: _commonTextFormField(correct, wrong, empty, dogruText),
          ),
          Flexible(
            child: _commonTextFormField(wrong, correct, empty, yanlisText),
          ),
          Flexible(
            child: _commonEmptyTextFormFiled(empty),
          )
        ],
      ),
    );
  }

  TextFormField _commonEmptyTextFormFiled(TextEditingController empty) {
    return TextFormField(
        readOnly: true,
        controller: empty,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Boş',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          } else if (int.parse(value) < 0) {
            return "Gözden geçir";
          } else {
            return null;
          }
        });
  }

  TextFormField _commonTextFormField(
      TextEditingController first,
      TextEditingController second,
      TextEditingController empty,
      String labelText) {
    return TextFormField(
      maxLength: 2,
      controller: first,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          counterText: ""),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Değer gir';
        } else if (int.parse(value) > 40) {
          return "max 40";
        } else if (second.text.isNotEmpty &&
            (int.parse(value) + int.parse(second.text)) > 40) {
          return "Gözden geçir";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        if (second.text.isNotEmpty && first.text.isNotEmpty) {
          empty.text = (40 - (int.parse(second.text) + int.parse(first.text)))
              .toString();
        }
      },
    );
  }
}
