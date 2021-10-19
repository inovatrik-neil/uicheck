import 'package:flutter/material.dart';
import 'package:uicheck/neiltest/Indicator.dart';
import 'package:uicheck/neiltest/detail.dart';
import 'package:uicheck/neiltest/home.dart';
import 'package:uicheck/neiltest/idea.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late PageController _pageController;

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[Home(), Detail(), Idea()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(),
      body:IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xFF676777),
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Color(0xFF3655F2),
              size: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Detail',
            icon: Icon(
              Icons.description_outlined,
              color: Color(0xFF676777),
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.description,
              color: Color(0xFF3655F2),
              size: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Idea',
            icon: Icon(
              Icons.lightbulb_outline,
              color: Color(0xFF676777),
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.lightbulb,
              color: Color(0xFF3655F2),
              size: 24.0,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
