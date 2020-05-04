import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerplay/models/user_model.dart';
import 'package:providerplay/widgets/menu_icon.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with AfterLayoutMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    nameController.text = userModel.userName;
    emailController.text = userModel.userEmail;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: MenuIconWidget(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Container(
        child: ListenableProvider.value(
          value: userModel,
          child: Consumer<UserModel>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "This User name and password will be updated in left side menu after submit",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Divider(height: 1, color: Colors.grey),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "User Name", labelText: "User Name"),
                      controller: nameController,
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Email", labelText: "Email"),
                      controller: emailController,
                    ),
                    SizedBox(height: 40),
                    submitButton(context),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  SizedBox submitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(14),
        child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold)),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        elevation: 0.1,
        onPressed: () async {
          await Provider.of<UserModel>(context, listen: false).setUserData(
              nameController.text.trim(), emailController.text.trim());
        },
      ),
    );
  }
}
