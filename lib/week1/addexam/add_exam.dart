import 'package:flutter/material.dart';
import '../addlesson/addlesson.dart';
import '../models/sinav.dart';

class AddExam extends StatefulWidget {
  const AddExam({Key? key}) : super(key: key);

  @override
  // State<AddExam> createState() => _AddExamState();
  _AddExamState createState() => _AddExamState();
}

class _AddExamState extends State<AddExam> {
  final appBarTitle = "Sınav Ekle";
  final TextEditingController _sinavAdController = TextEditingController();
  late Sinav sinav = Sinav(1, _sinavAdController.text);
  final _addFormKey = GlobalKey<FormState>();
  // final TextEditingController adController = TextEditingController(text: sinav.sinavAd);

  void save(String ad) {
    print(ad);
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
                              Text('Sınav Adı'),
                              TextFormField(
                                controller: _sinavAdController,
                                decoration: const InputDecoration(
                                  hintText: 'Sınav Adı',
                                ),
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
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                // splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    //kontrol gerekebilir
                                    save(_sinavAdController.text);
                                    // _addFormKey.currentState.save();
                                    // api.createCase(Cases(
                                    //     name: _nameController.text,
                                    //     gender: gender,
                                    //     age: int.parse(_ageController.text),
                                    //     address: _addressController.text,
                                    //     city: _cityController.text,
                                    //     country: _countryController.text,
                                    //     status: status));

                                    // Navigator.pop(context);

                                    // alertDialog(
                                    //   context,
                                    // );

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddLesson()),
                                    );
                                  }
                                },
                                child: Text('Save',
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
