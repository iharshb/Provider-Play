import 'package:flutter/material.dart';
import 'package:providerplay/pages/page_home.dart';
import 'package:providerplay/pages/page_setting.dart';
import 'package:providerplay/pages/page_employees.dart';

class NavigationProvider extends ChangeNotifier {
  String currentScreen = "Home";

  Widget get getNavigation {
    switch (currentScreen) {
      case "UsersScreen":
        return EmployeesPage();
        break;

      case "Settings":
        return SettingScreen();
        break;

      default:
        return HomePage();
        break;
    }
  }

  void updateNavigationScreen(String navigationScreen) {
    currentScreen = navigationScreen;
    notifyListeners();
  }
}
