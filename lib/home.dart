import 'package:flutter/material.dart';
import 'package:my_flutter/constants/colors.dart';
import 'package:my_flutter/constants/navigations.dart';
import 'package:my_flutter/models/drawerItem.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final menuItems = [
    new MenuItem("Beranda", Icons.home, route: AppRoutes.HOME),
    new MenuItem("Carroussel", Icons.album,
        route: AppRoutes.CARROUSSEL),
    new MenuItem("Carroussel Bloc", Icons.album,
        route: AppRoutes.CARROUSSEL+"_"),
  ];

  List<Widget> _buildSection(
      {BuildContext context, String type, List<MenuItem> items}) {
    return [
      Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            type,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      ...items.map(
        (item) => _buildItem(item, context),
      )
    ];
  }

  Widget _buildItem(MenuItem item, context) {
    return new ListTile(
      title: new Text(item.title),
      leading: new Icon(item.icon),
      onTap: () {
        Navigator.pop(context);
        if (item.isRoot) {
          Navigator.pushReplacementNamed(context, item.route);
        } else {
          Navigator.pushNamed(context, item.route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('b4affan@gmail.com'),
              accountName: Text("Moh. Affan"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/myAvatar.png"),
                backgroundColor: Colors.transparent,
              ),
              margin: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    MoonLite.start,
                    MoonLite.middle,
                    MoonLite.end,
                  ],
                ),
              ),
            ),
            ..._buildSection(
              context: context,
              items: menuItems ?? [],
              type: "My Flutter",
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30,
              left: 10,
              child: Builder(
                builder: (BuildContext c) => IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => Scaffold.of(c).openDrawer(),
                    ),
              ),
            ),
            Center(
              child: Text(
                "My Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              BlueRaspberry.start,
              BlueRaspberry.end,
            ],
          ),
        ),
      ),
    );
  }
}
