import 'package:fit_gym/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            groupAlignment: 1,
            extended: isExtended,
            backgroundColor: mainColor,
            minWidth: 120,
            minExtendedWidth: 200,
            leading: MaterialButton(
              child:
                  Icon(isExtended ? Icons.arrow_back : Icons.arrow_right_alt),
              onPressed: () {
                setState(() {
                  isExtended = !isExtended;
                });
              },
            ),
            trailing: MaterialButton(
              elevation: 5,
              height: 65,
              color: Colors.amberAccent,
              child: Text(
                'Çıkış',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
            labelType: isExtended
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(
                  Icons.mode_edit,
                  color: Colors.white,
                  size: 35,
                ),
                selectedIcon: Icon(
                  Icons.mode_edit,
                  color: Colors.white,
                  size: 50,
                ),
                label: Text(
                  'Düzenle',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.person_add_alt,
                  color: Colors.white,
                  size: 35,
                ),
                selectedIcon: Icon(
                  Icons.person_add_alt,
                  color: Colors.white,
                  size: 50,
                ),
                label: Text(
                  'Yeni Kayıt',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 35,
                ),
                selectedIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 50,
                ),
                label: Text(
                  'Ara',
                  style: TextStyle(color: Colors.white),
                ),
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
