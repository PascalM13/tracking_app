import 'package:flutter/material.dart';

import '../index/allscreens.dart';

//Dashboard:
class MyActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //fill the menue:
    final drawerList = ListView(children: [
      UserAccountsDrawerHeader(
        accountName:
            Text('Vorname Nachname'), //TODO: mit richtigem Profil verknüpfen
        accountEmail: Text('E-Mail'), //TODO: mit richtigem Account verknüpfen
        currentAccountPicture: Icon(
          Icons.account_circle,
          color: Colors.black,
          size: 50.0,
        ),
      ),
      ListTile(
          title: Text('Dashboard'),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MyDashboardPage()));
          }),
      Divider(),
      ListTile(
          title: Text('Activity'),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MyActivityPage()));
          }),
      Divider(),
      ListTile(
          title: Text('Add Activity'),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MyAddActivityPage()));
          }),
      Divider(),
      ListTile(
          title: Text('Sensor'),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MySensorPage()));
          }),
    ]);
    //create the screen for activity:
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Activity'),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Row for "move minute" includes icon, short description and the value
                Text('Hier kommt die Übersicht über die Aktivitäten hin'),
                Row(children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.orange,
                    size: 50.0,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Move minute:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 27),
                  Text(
                    //TODO: Sensordaten für Minuten hier ausgeben
                    '1234 min',
                    style: TextStyle(fontSize: 20),
                  ),
                ]),
                SizedBox(height: 15),
                Row(children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.orange,
                    size: 50.0,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Heart pulse:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 40),
                  Text(
                    //TODO: Sensordaten für Puls hier ausgeben
                    '1234 bpm',
                    style: TextStyle(fontSize: 20),
                  ),
                ]),
                SizedBox(height: 15),
                Row(children: [
                  Icon(
                    Icons.directions_run_rounded,
                    color: Colors.orange,
                    size: 50.0,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Steps:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 92),
                  Text(
                    //TODO: Sensordaten für Schritte hier ausgeben
                    '1234',
                    style: TextStyle(fontSize: 20),
                  ),
                ]),
                SizedBox(height: 15),
                Row(children: [
                  Icon(
                    Icons.fastfood,
                    color: Colors.orange,
                    size: 50.0,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Calories:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 70),
                  Text(
                    //TODO: Sensordaten für Kalorien hier ausgeben
                    '1234 kcal',
                    style: TextStyle(fontSize: 20),
                  ),
                ]),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: drawerList,
        ));
  }
}
