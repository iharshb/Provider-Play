import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerplay/providers/employee_provider.dart';
import 'package:providerplay/widgets/progressview.dart';

class AddEmployeePage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
      ),
      body: ProgressWidget(
        opacity: 0.6,
        isShow: Provider.of<EmployeeProvider>(context).isLoading,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: "Employee Name", labelText: "Employee Name"),
                controller: nameController,
              ),
              SizedBox(height: 20),
              TextField(
                decoration:
                    InputDecoration(hintText: "Salary", labelText: "Salary"),
                keyboardType: TextInputType.number,
                controller: salaryController,
              ),
              SizedBox(height: 20),
              TextField(
                decoration:
                    InputDecoration(hintText: "Salary", labelText: "Age"),
                keyboardType: TextInputType.number,
                controller: ageController,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(14),
                  child: Text("Submit",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  elevation: 0.1,
                  onPressed: () async {
                    await Provider.of<EmployeeProvider>(context, listen: false)
                        .addEmployee(
                            context,
                            jsonEncode({
                              'name': nameController.text.trim(),
                              'salary': salaryController.text.trim(),
                              'age': ageController.text.trim(),
                            }));

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
