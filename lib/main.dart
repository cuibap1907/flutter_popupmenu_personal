import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_personal_popupmenu/screen/personal_view.dart';
import 'package:flutter_personal_popupmenu/screen/search_view.dart';

void main() {
  runApp(MainNavigator());
}

class MainNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget PopupItemChild(String _text, Icon _icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[_icon, Text(_text)],
    );
  }

  Widget PopupMenuIcon() {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.work,
        size: 30,
        color: Colors.blue,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "menu_1",
          child: PopupItemChild(
              "Menu 1",
              Icon(
                Icons.notifications,
                size: 30,
                color: Colors.blueAccent,
              )),
        ),
        PopupMenuItem<String>(
          value: "menu_2",
          child: PopupItemChild(
              "Menu 2",
              Icon(
                Icons.notifications_active,
                size: 30,
                color: Colors.red,
              )),
        ),
      ],
    );
  }

  Widget _homePopupMenu()
  {
    return PopupMenuButton<int>(
      icon: Icon(Icons.menu, size: 30, color: Colors.white),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>> [
        PopupMenuItem<int>(
          value: 1,
          child: PopupItemChild("Personal", Icon(Icons.person, size: 30, color: Colors.black)),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: PopupItemChild("Search", Icon(Icons.search, size: 30, color: Colors.black)),
        ),
        PopupMenuItem<int>(
          value: 3,
          child: PopupItemChild("Setting", Icon(Icons.settings, size: 30, color: Colors.red)),
        ),
      ],
      onSelected: (selectedVal) {
        switch(selectedVal)
        {
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalView()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView()));
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Home"),
        leading: _homePopupMenu(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        titleSpacing: 2.0,
      ),
      body: PopupMenuIcon(),
      floatingActionButton: PopupMenuIcon(),
    );
  }
}
