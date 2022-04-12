import 'package:flutter/material.dart';

class AddLesson extends StatefulWidget {
  const AddLesson({Key? key}) : super(key: key);

  @override
  State<AddLesson> createState() => _AddLessonState();
}

class _AddLessonState extends State<AddLesson> {
  final String appBarTitle = "Sınav Bilgisi Gir";
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
      body: Column(
        children: <Widget>[
          ElevatedButton(
            // splashColor: Colors.red,
            onPressed: () {
              {
                // Navigator.pop(context);
                // Navigator.pop(context);
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
            child: Text('geri dön', style: TextStyle(color: Colors.white)),
            // color: Colors.blue,
          )
        ],
      ),
    );
  }
}
