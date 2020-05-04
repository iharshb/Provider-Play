import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerplay/models/user_model.dart';
import 'package:providerplay/pages/page_onboarding.dart';
import 'package:providerplay/providers/navigation_provider.dart';
import 'package:providerplay/providers/name_provider.dart';
import 'package:providerplay/providers/employee_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<UserModel>.value(value: UserModel()),

        ChangeNotifierProvider<UserModel>(create: (BuildContext context) {
          return UserModel();
        }),

        ChangeNotifierProvider<NavigationProvider>(
            create: (BuildContext context) {
          return NavigationProvider();
        }),
        ChangeNotifierProvider<NamesProvider>(create: (BuildContext context) {
          return NamesProvider();
        }),
        ChangeNotifierProvider<EmployeeProvider>(
            create: (BuildContext context) {
          return EmployeeProvider();
        })
      ],
      child: MaterialApp(
        title: 'ProviderPlay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnBoardingPage(),
      ),
    );
  }
}
