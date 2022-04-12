import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/addexam/add_exam.dart';

// import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final appBarTitle = "Todo Moon";

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // children: homeViewCards,
        children: <Widget>[
          Expanded(
            // alignment: Alignment.topCenter,
            // child: addExam(),
            child: Container(
              padding: const EdgeInsets.only(bottom: 8),
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
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      // leading: FlutterLogo(size: 56.0),
                      leading: Icon(Icons.pending_actions),
                      // trailing: Icon(Icons.pending_actions),
                      title: Text('Sınavlarım'),
                      subtitle: Text('Mevcut sınavları görüntüle'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            // alignment: Alignment.bottomCenter,
            // child: myProgress(),
            child: Container(
              padding: const EdgeInsets.only(bottom: 8),
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
                            MaterialPageRoute(builder: (context) => AddExam()),
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

  // List<Widget> get homeViewCards {
  //   return <Widget>[
  //     Expanded(
  //       // alignment: Alignment.topCenter,
  //       child: addExam(),
  //     ),
  //     Expanded(
  //       child: myExams(),
  //     ),
  //     Expanded(
  //       // alignment: Alignment.bottomCenter,
  //       child: myProgress(),
  //     ),
  //   ];
  // }

  // Container myProgress() {
  //   return Container(
  //     padding: const EdgeInsets.only(bottom: 8),
  //     child: Card(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           const ListTile(
  //             // leading: FlutterLogo(size: 56.0),
  //             // trailing: Icon(Icons.query_stats_outlined),
  //             leading: Icon(Icons.query_stats_outlined),
  //             title: Text('Gelişim'),
  //             subtitle: Text('Gelişimini gör'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Container myExams() {
  //   return Container(
  //     padding: const EdgeInsets.only(bottom: 8),
  //     child: Card(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           const ListTile(
  //             // leading: FlutterLogo(size: 56.0),
  //             leading: Icon(Icons.pending_actions),
  //             // trailing: Icon(Icons.pending_actions),
  //             title: Text('Sınavlarım'),
  //             subtitle: Text('Mevcut sınavları görüntüle'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

//   Container addExam() {
//     return Container(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Card(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const ListTile(
//               // leading: FlutterLogo(size: 56.0),
//               leading: Icon(Icons.add_box_outlined),
//               // trailing: Icon(Icons.add_box_outlined),
//               title: Text('Sınav Ekle'),
//               subtitle: Text('Listeye yeni bir sınav ekle'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
