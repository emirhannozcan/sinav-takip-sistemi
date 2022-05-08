import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/charts/multiple_charts.dart';
import 'package:flutter_application_1/week1/exam/add_exam.dart';
import 'package:flutter_application_1/week1/examlist/examlist.dart';
import 'package:flutter_application_1/week1/motivation/motivation.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final appBarTitle = "Öğrenci Takip";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Material App Bar'),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo))],
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.face),
            Text(appBarTitle,
                style: Theme.of(context).primaryTextTheme.headline5)
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // children: homeViewCards,
        children: <Widget>[
          Expanded(
            // alignment: Alignment.topCenter,
            // child: addExam(),
            child: Container(
              // padding: const EdgeInsets.only(bottom: 4),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        // leading: FlutterLogo(size: 56.0),
                        leading: Icon(Icons.add_box_outlined),
                        // trailing: Icon(Icons.add_box_outlined),
                        title: Text('Sınav Ekle'),
                        subtitle: Text('Listeye yeni bir sınav ekle'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddExam()),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            // child: myExams(),
            child: Container(
              // padding: const EdgeInsets.only(bottom: 4),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        // leading: FlutterLogo(size: 56.0),
                        leading: Icon(Icons.list_alt_outlined),
                        // trailing: Icon(Icons.pending_actions),
                        title: Text('Sınavlarım'),
                        subtitle: Text('Mevcut sınavları görüntüle'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExamList()),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => AddExam()),
                          // );
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            // alignment: Alignment.bottomCenter,
            // child: myProgress(),
            child: Container(
              // padding: const EdgeInsets.only(bottom: 4),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        // leading: FlutterLogo(size: 56.0),
                        // trailing: Icon(Icons.query_stats_outlined),
                        leading: Icon(Icons.query_stats_outlined),
                        title: Text('Gelişim'),
                        subtitle: Text('Gelişimini gör'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MultipleChart()),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            // child: myExams(),
            child: Container(
              // padding: const EdgeInsets.only(bottom: 4),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        // leading: FlutterLogo(size: 56.0),
                        leading: Icon(Icons.battery_charging_full_rounded),
                        // trailing: Icon(Icons.pending_actions),
                        title: Text('Motive Ol'),
                        subtitle:
                            Text('İhtiyaç duyduğun anda motivasyonunu sağla'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Motivation()),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
