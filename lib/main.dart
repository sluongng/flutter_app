import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}


class Choice {
  const Choice({ this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'HOME', icon: Icons.home),
  const Choice(title: 'EXPERIENCE', icon: Icons.work),
  const Choice(title: 'EDUCATION', icon: Icons.school),
  const Choice(title: 'SKILL', icon: Icons.extension),
  const Choice(title: 'PORTFOLIO', icon: Icons.art_track),
  const Choice(title: 'CONTACT', icon: Icons.contact_mail),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Title Section
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lake Name
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Just some random lake',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Location
                new Text(
                  'Random Location, Country',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

          // Star Icon
          new Icon(
            Icons.star,
            color: Colors.yellow[600],
          ),

          // Star Count
          new Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.textsms, 'SMS'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Blah blah something something lakaly lake lake 123123
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('Son Luong Ngoc'),
            centerTitle: true,
            bottom: new TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                  icon: new Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: new ListView(
            children: [
              new Image.asset(
                'images/lake.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              buttonSection,
              titleSection,
              textSection,
            ],
          ),
        )
      ),
    );
  }
}
