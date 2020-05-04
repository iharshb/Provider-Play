import 'dart:core';

import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  UserModel() {
    setUserData("admin@gmail.com", "admin@123");
  }

  String userName = "";
  String userEmail = "";

  setUserData(String name, String email) {
    userName = name;
    userEmail = email;
    notifyListeners();
  }
}
