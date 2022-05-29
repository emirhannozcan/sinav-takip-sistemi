import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/sidebar/sidebar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final appBarTitle = "Sınav Takip Sistemi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appBarTitle,
                style: Theme.of(context).primaryTextTheme.headline5)
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      drawer: SideBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _dynamicListTile(context, Icons.add_box_outlined, 'Sınav Ekle',
              'Listeye yeni bir sınav ekle', 'AddExam'),
          _dynamicListTile(context, Icons.list_alt_outlined, 'Sınavlarım',
              'Mevcut sınavları görüntüle', 'ExamList'),
          _dynamicListTile(context, Icons.query_stats_outlined, 'Gelişim',
              'Gelişimini gör', 'MultipleChart'),
          _dynamicListTile(
              context,
              Icons.battery_charging_full_rounded,
              'Motive Ol',
              'İhtiyaç duyduğun anda motivasyonunu sağla',
              'Motivation'),
        ],
      ),
    );
  }

  Expanded _dynamicListTile(BuildContext context, IconData icon, String title,
      String subtitle, String pageRouteText) {
    return Expanded(
      child: Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(icon),
                  title: Text(title),
                  subtitle: Text(subtitle),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      pageRouteText,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
