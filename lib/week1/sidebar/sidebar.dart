import 'package:flutter/material.dart';
import 'package:flutter_application_1/week1/motivation/motivation.dart';

class SideBar extends StatefulWidget {
  SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menuler'),
          ),
          ListTile(
              leading: const Icon(Icons.pages_sharp),
              title: Text('Motivasyon'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Motivation()),
                );
              }),
        ],
      ),
    );
  }
}
