import 'package:flutter/material.dart';
import 'package:providerplay/models/add_employee_response.dart';
import 'package:providerplay/models/common_response.dart';
import 'package:providerplay/models/employee_response.dart';
import 'package:providerplay/service/z_imports_services.dart';

class EmployeeRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<EmployeeData>> getEmployeeList(BuildContext context) async {
    final response = await _helper.get(context, "employees");
    EmployeeResponse empResponse = EmployeeResponse.fromJson(response);
    return empResponse.data;
  }

  Future<AddEmployeeResponse> addEmployee(
      BuildContext context, var body) async {
    final response = await _helper.post(context, "create", body);
    AddEmployeeResponse empResponse = AddEmployeeResponse.fromJson(response);
    return empResponse;
  }
}
