import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/dal/dbhelper.dart';
import '../models/sinav.dart';
import 'package:flutter/services.dart';

//güncelleme kısmı tekrardan kontrol edilecek

class UpdateExam extends StatefulWidget {
  late Sinav sinav;
  // late int sinavID;
  // UpdateExam(this.sinavID);
  UpdateExam(this.sinav, {Key? key}) : super(key: key);
  // const UpdateExam({Key? key, required Sinav sinav})
  //  UpdateExam({Key? key}, this.sinav)
  // : super(key: key); //required ve sinav kısmı silinebilir

  @override
  // _UpdateExamState createState() => _UpdateExamState(sinavID);
  _UpdateExamState createState() => _UpdateExamState(sinav);
}

class _UpdateExamState extends State<UpdateExam> {
  late Sinav sinav;
  // late int sinavID;
  // _UpdateExamState(this.sinavID);
  _UpdateExamState(this.sinav);

  final DbHelper _dbHelper = DbHelper();
  final appBarTitle = "Sınav Ekle";
  final dogruText = "Doğru";
  final fizikTitle = "Fizik";
  final matematikTitle = "Matematik";
  final saveText = "Güncelle";
  final sosyalTitle = "Sosyal Bilgiler";
  final turkceTitle = "Türkçe";
  final yanlisText = "Yanlış";

  var _sinavId = null;
  var _addFormKey = GlobalKey<FormState>();
  var _sinavAdController = TextEditingController();
  var _fenBController = TextEditingController();
  var _fenDController = TextEditingController();
  var _fenYController = TextEditingController();
  var _matBController = TextEditingController();
  var _matDController = TextEditingController();
  var _matYController = TextEditingController();
  var _sosBController = TextEditingController();
  var _sosDController = TextEditingController();
  var _sosYController = TextEditingController();
  var _turBController = TextEditingController();
  var _turDController = TextEditingController();
  var _turYController = TextEditingController();

  void _UpdateExam(Sinav sinav) async {
    await _dbHelper.update(sinav);
    print("tamamlandı");
  }

  @override
  void initState() {
    _sinavId = sinav.id;
    // print(sinav.id);
    // print(_sinavId);
    _sinavAdController.text = sinav.sinavAd;
    _fenBController.text = sinav.fenB.toString();
    _fenDController.text = sinav.fenD.toString();
    _fenYController.text = sinav.fenY.toString();
    _matBController.text = sinav.matB.toString();
    _matDController.text = sinav.matD.toString();
    _matYController.text = sinav.matY.toString();
    _sosBController.text = sinav.sosB.toString();
    _sosDController.text = sinav.sosD.toString();
    _sosYController.text = sinav.sosY.toString();
    _turBController.text = sinav.turB.toString();
    _turDController.text = sinav.turD.toString();
    _turYController.text = sinav.turY.toString();

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
            Icon(Icons.add_box_outlined),
            Text(appBarTitle,
                style: Theme.of(context).primaryTextTheme.headline5)
          ],
        ),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Sınav Ekle'),
                              TextFormField(
                                maxLength: 10,
                                controller: _sinavAdController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Sınav Adı',
                                    hintText: 'Sınav Adı',
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
                        Text('Matematik'),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  maxLength: 2,
                                  controller: _matDController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: dogruText,
                                      counterText: ""
                                      // hintText: dogruText,
                                      ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Değer gir';
                                    } else if (int.parse(value) > 40) {
                                      return "max 40";
                                    } else if (_matYController
                                            .text.isNotEmpty &&
                                        (int.parse(value) +
                                                int.parse(
                                                    _matYController.text)) >
                                            40) {
                                      return "Gözden geçir";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (_matYController.text.isNotEmpty &&
                                        _matYController.text.isNotEmpty) {
                                      _matBController.text = (40 -
                                              (int.parse(_matDController.text) +
                                                  int.parse(
                                                      _matYController.text)))
                                          .toString();
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 2,
                                  controller: _matYController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: yanlisText,
                                      counterText: ""
                                      // hintText: yanlisText,
                                      ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Değer gir';
                                    } else if (int.parse(value) > 40) {
                                      return "max 40";
                                    } else if (_matDController
                                            .text.isNotEmpty &&
                                        (int.parse(value) +
                                                int.parse(
                                                    _matDController.text)) >
                                            40) {
                                      return "Gözden geçir";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (_matDController.text.isNotEmpty &&
                                        value.isNotEmpty) {
                                      _matBController.text = (40 -
                                              (int.parse(_matDController.text) +
                                                  int.parse(
                                                      _matYController.text)))
                                          .toString();
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  // enabled: false,
                                  readOnly: true,
                                  controller: _matBController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Boş',
                                    hintText: 'Boş',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text('Türkçe'),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  maxLength: 2,
                                  controller: _turDController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: dogruText,
                                      counterText: ""
                                      // hintText: dogruText,
                                      ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Değer gir';
                                    } else if (int.parse(value) > 40) {
                                      return "max 40";
                                    } else if (_turYController
                                            .text.isNotEmpty &&
                                        (int.parse(value) +
                                                int.parse(
                                                    _turYController.text)) >
                                            40) {
                                      return "Gözden geçir";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (_turDController.text.isNotEmpty &&
                                        _turYController.text.isNotEmpty) {
                                      _turBController.text = (40 -
                                              (int.parse(_turDController.text) +
                                                  int.parse(
                                                      _turYController.text)))
                                          .toString();
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 2,
                                  controller: _turYController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: yanlisText,
                                      counterText: ""
                                      // hintText: yanlisText,
                                      ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Değer gir';
                                    } else if (int.parse(value) > 40) {
                                      return "max 40";
                                    } else if (_turDController
                                            .text.isNotEmpty &&
                                        (int.parse(value) +
                                                int.parse(
                                                    _turDController.text)) >
                                            40) {
                                      return "Gözden geçir";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (int.parse(_turDController.text) !=
                                            null &&
                                        int.parse(_turYController.text) !=
                                            null) {
                                      _turBController.text = (40 -
                                              (int.parse(_turDController.text) +
                                                  int.parse(
                                                      _turYController.text)))
                                          .toString();
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  // enabled: false,
                                  readOnly: true,
                                  controller: _turBController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Boş',
                                    hintText: 'Boş',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text('Fen'),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  maxLength: 2,
                                  controller: _fenDController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: dogruText,
                                      counterText: ""
                                      // hintText: dogruText,
                                      ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Değer gir';
                                    } else if (int.parse(value) > 40) {
                                      return "max 40";
                                    } else if (_fenYController
                                            .text.isNotEmpty &&
                                        (int.parse(value) +
                                                int.parse(
                                                    _fenYController.text)) >
                                            40) {
                                      return "Gözden geçir";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (_fenDController.text.isNotEmpty &&
                                        _fenYController.text.isNotEmpty) {
                                      _fenBController.text = (40 -
                                              (int.parse(_fenDController.text) +
                                                  int.parse(
                                                      _fenYController.text)))
                                          .toString();
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 2,
                                  controller: _fenYController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: yanlisText,
                                      counterText: ""
                                      // hintText: yanlisText,
                                      ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Değer gir';
                                    } else if (int.parse(value) > 40) {
                                      return "max 40";
                                    } else if (_fenDController
                                            .text.isNotEmpty &&
                                        (int.parse(value) +
                                                int.parse(
                                                    _fenDController.text)) >
                                            40) {
                                      return "Gözden geçir";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (_fenDController.text.isNotEmpty &&
                                        _fenYController.text.isNotEmpty) {
                                      _fenBController.text = (40 -
                                              (int.parse(_fenDController.text) +
                                                  int.parse(
                                                      _fenYController.text)))
                                          .toString();
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  // enabled: false,
                                  readOnly: true,
                                  controller: _fenBController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Boş',
                                    hintText: 'Boş',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text('Sosyal'),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  maxLength: 2,
                                  controller: _sosDController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: dogruText,
                                      counterText: ""
                                      // hintText: dogruText,
                                      ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Değer gir';
                                    } else if (int.parse(value) > 40) {
                                      return "max 40";
                                    } else if (_sosYController
                                            .text.isNotEmpty &&
                                        (int.parse(value) +
                                                int.parse(
                                                    _sosYController.text)) >
                                            40) {
                                      return "Gözden geçir";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (_sosDController.text.isNotEmpty &&
                                        _sosYController.text.isNotEmpty) {
                                      _sosBController.text = (40 -
                                              (int.parse(_sosDController.text) +
                                                  int.parse(
                                                      _sosYController.text)))
                                          .toString();
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  maxLength: 2,
                                  controller: _sosYController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: yanlisText,
                                      counterText: ""
                                      // hintText: yanlisText,
                                      ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Değer gir';
                                    } else if (int.parse(value) > 40) {
                                      return "max 40";
                                    } else if (_sosDController
                                            .text.isNotEmpty &&
                                        (int.parse(value) +
                                                int.parse(
                                                    _sosDController.text)) >
                                            40) {
                                      return "Gözden geçir";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (_sosDController.text.isNotEmpty &&
                                        _sosYController.text.isNotEmpty) {
                                      _sosBController.text = (40 -
                                              (int.parse(_sosDController.text) +
                                                  int.parse(
                                                      _sosYController.text)))
                                          .toString();
                                    }
                                  },
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  // enabled: false,
                                  readOnly: true,
                                  controller: _sosBController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Boş',
                                    hintText: 'Boş',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                // splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    //kontrol gerekebilir
                                    _UpdateExam(Sinav(
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

                                    // _addFormKey.currentState.save();
                                    // api.createCase(Cases(
                                    //     name: _nameController.text,
                                    //     gender: gender,
                                    //     age: int.parse(_ageController.text),
                                    //     address: _addressController.text,
                                    //     city: _cityController.text,
                                    //     country: _countryController.text,
                                    //     status: status));

                                    Navigator.pop(context);

                                    // alertDialog(
                                    //   context,
                                    // );

                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => AddLesson()),
                                    // );
                                  }
                                },
                                child: Text(saveText,
                                    style: TextStyle(color: Colors.white)),
                                // color: Colors.blue,
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
}

Future alertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Done'),
          content: Text('Add Success'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
