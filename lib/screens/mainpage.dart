import 'package:fit_gym/components/constants.dart';
import 'package:fit_gym/screens/edit_container.dart';
import 'package:fit_gym/screens/register_container.dart';
import 'package:fit_gym/screens/search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            selectedIconTheme: IconThemeData(
              color: Colors.white,
              size: 50,
            ),
            unselectedIconTheme: IconThemeData(
              size: 35,
              color: Colors.white,
            ),
            groupAlignment: 1,
            extended: isExtended,
            backgroundColor: mainColor,
            minWidth: 120,
            minExtendedWidth: 200,
            leading: MaterialButton(
              height: 65,
              child: Icon(
                isExtended ? Icons.arrow_back : Icons.arrow_forward,
                color: Colors.white,
              ),
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
              child: Row(
                children: [
                  Icon(Icons.logout),
                  Text(
                    '  Çıkış',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
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
                  Icons.drive_file_rename_outline,
                ),
                selectedIcon: Icon(
                  Icons.mode_edit,
                ),
                label: Text(
                  'Düzenle',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.person_add_alt,
                ),
                selectedIcon: Icon(
                  Icons.person_add_alt,
                ),
                label: Text(
                  'Yeni Kayıt',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.search,
                ),
                selectedIcon: Icon(
                  Icons.search,
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
            child: buildPages(),
          )
        ],
      ),
    );
  }

  Widget buildPages() {
    switch (_selectedIndex) {
      case 0:
        return EditContainer();
      case 1:
        return RegisterContainer();
      case 2:
        return SearchContainer();
      default:
        return EditContainer();
    }
  }
}
