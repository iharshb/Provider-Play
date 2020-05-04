import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerplay/models/user_model.dart';
import 'package:providerplay/providers/navigation_provider.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    final userModel = Provider.of<UserModel>(context);
    return Scaffold(
      drawer: Drawer(
          child: Column(children: <Widget>[
        Consumer<UserModel>(builder: (context, value, child) {
          return UserAccountsDrawerHeader(
            accountName: Text(value.userName ?? ""),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            accountEmail: Text(value.userEmail ?? ""),
          );
        }),
        ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.of(context).pop();
            navigation.updateNavigationScreen("Home");
          },
        ),
        ListTile(
          title: Text("Employees"),
          leading: Icon(Icons.person),
          onTap: () {
            Navigator.of(context).pop();
            navigation.updateNavigationScreen("UsersScreen");
          },
        ),
        ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.of(context).pop();
            navigation.updateNavigationScreen("Settings");
          },
        ),
      ])),
      body: Consumer<NavigationProvider>(
          builder: (context, navigationProvider, _) =>
              navigationProvider.getNavigation),
    );
  }
}
