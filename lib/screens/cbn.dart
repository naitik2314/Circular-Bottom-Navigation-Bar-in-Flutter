import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    new TabItem(Icons.search, "Search", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.layers, "Reports", Colors.red),
    new TabItem(Icons.notifications, "Notification", Colors.cyan),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].circleColor;
    String slogan;
    switch (selectedPos) {
      case 0:
        slogan = 'XYZ';
        break;
      case 1:
        slogan = 'QWE';
        break;
      case 2:
        slogan = 'RTY';
        break;
      case 3:
        slogan = 'UIO';
        break;
    }
    return Container(
      color: selectedColor,
      child: Center(
        child: Text(
          slogan,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }
}
