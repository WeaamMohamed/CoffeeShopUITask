import 'package:coffe_shop_task/screens/bookmarks_screen.dart';
import 'package:coffe_shop_task/screens/coffee_favorites_screen.dart';
import 'package:coffe_shop_task/screens/coffee_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop_task/screens/coffee_home_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:coffe_shop_task/shared/styles/colors.dart';

class ControlView extends StatefulWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  State<ControlView> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  int _selectedItem = 0;
  List<Widget> screensList = [
    CoffeeHomeScreen(),
    CoffeeFavoritesScreen(),
    BookmarksScreen(),
    CoffeeProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [

          Icons.home,
          Icons.favorite_border,
          Icons.bookmark_border,
          Icons.person,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,
      ),

      body: screensList[_selectedItem]
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
        required this.iconList,
        required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60 ,
        width: MediaQuery.of(context).size.width / _iconList.length,

        margin: EdgeInsets.only(bottom: 10, top: 5),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                padding: EdgeInsets.symmetric( vertical: 12, horizontal: 15),
                decoration: index == _selectedIndex
                    ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cPrimaryColor,
                )  : BoxDecoration(),
                child:  Icon(
                    icon,
                    color: index == _selectedIndex ? Colors.white : Colors.grey[400],
                  ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}