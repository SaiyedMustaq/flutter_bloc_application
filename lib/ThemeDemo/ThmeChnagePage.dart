import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ThemeChangePage extends StatefulWidget {
  @override
  _ThemeChangePageState createState() => _ThemeChangePageState();
}

class _ThemeChangePageState extends State<ThemeChangePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      endDrawerEnableOpenDragGesture: false,
      bottomSheet: Container(),
      drawerEnableOpenDragGesture: true,
      onDrawerChanged: (isOpened) {
        EasyLoading.showToast(isOpened.toString());
      },
      onEndDrawerChanged: (isOpened) {
        EasyLoading.showToast(isOpened.toString());
      },
      resizeToAvoidBottomInset: true,
      drawerDragStartBehavior: DragStartBehavior.start,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        elevation: 12.0,
        iconSize: 30.0,
        selectedIconTheme: IconThemeData(
          color: Colors.red,
          size: 35.0,
        ),
        selectedLabelStyle: TextStyle(
          color: Colors.red,
          fontSize: 12.0,
        ),
        showSelectedLabels: true,
        unselectedFontSize: 10.0,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 20.0,
        ),
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(),
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {},
        child: Text('Click'),
      ),
      endDrawer: Container(
        color: Colors.white,
        child: Center(
          child: Text('End Drawer'),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
