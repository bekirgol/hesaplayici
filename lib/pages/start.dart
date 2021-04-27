import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:harfnotuhesaplama/pages/about_us.dart';
import 'package:harfnotuhesaplama/pages/account.dart';
import 'package:harfnotuhesaplama/pages/home.dart';

class StartPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StartPages();
  }
}

class _StartPages extends State<StartPages> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screen = [
    HomePage(),
    AccountPages(),
    AboutUsPages(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapper(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: _onItemTapper,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Hesabım'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.album_sharp),
            title: Text('Hakkımızda'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
