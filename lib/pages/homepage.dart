import 'package:cryptconverter/layout.dart';
import 'package:cryptconverter/pages/triangle_menu.dart';
import 'package:cryptconverter/pages/vignere_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      height: 5.0,
      width: isActive ? 50.0 : 8.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("CRYPTCNVRTR"),
        flexibleSpace: Container(
          width: SizeConfig.screenWidth,
          child: Align(
              alignment: Alignment(1, 0.35),
              child: Container(
                margin: EdgeInsets.only(left : 270),
                //color : Colors.lightGreenAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
            ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: PageView(
              controller: _pageController,
              physics: ClampingScrollPhysics(),
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                VignerePage(),
                TrianglePage(),
              ],
            ),
          ),
          //page indicator
        ],
      ),
    );
  }
}
