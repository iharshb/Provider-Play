import 'package:flutter/material.dart';

class NamesProvider extends ChangeNotifier {
  List<String> nameList = [];
  bool autoValidate = false;

  addNewName(String name) {
    if (!nameList.contains(name)) {
      nameList.add(name);
    } else {}
    notifyListeners();
  }

  clearAllNames() {
    nameList.clear();
    notifyListeners();
  }

  updateName(String name) {
    if (nameList.contains(name)) {
      String detectedName = nameList.firstWhere((nameItem) => nameItem == name);
      print(detectedName);
      for (int i = 0; i < nameList.length; i++) {
        if (nameList[i] == name) {
          nameList[i] = name;
          notifyListeners();
        }
      }
    }
  }

  setValidate(bool validate) {
    autoValidate = validate;
    notifyListeners();
  }

  deleteName(String name) {
    for (int i = 0; i < nameList.length; i++) {
      if (nameList[i] == name) {
        nameList.remove(nameList[i]);
        notifyListeners();
      }
    }
  }
}
