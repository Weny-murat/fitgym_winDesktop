import 'package:fit_gym/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: mainColor,
            minWidth: MediaQuery.of(context).size.width / 10,
            leading: MaterialButton(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 60,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            elevation: 5,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(
                  Icons.person_add_alt,
                  color: Colors.white,
                  size: 50,
                ),
                selectedIcon: Icon(
                  Icons.person_add_alt,
                  color: Colors.white,
                  size: 60,
                ),
                label: Text(
                  'Yeni Kayıt',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Text('selectedIndex: $_selectedIndex'),
            ),
          )
        ],
      ),
    );
  }
}
