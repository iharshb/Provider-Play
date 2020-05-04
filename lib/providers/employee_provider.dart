import 'package:flutter/cupertino.dart';
import 'package:providerplay/models/add_employee_response.dart';
import 'package:providerplay/models/common_response.dart';
import 'package:providerplay/models/employee_response.dart';
import 'package:providerplay/repository/employee_repository.dart';
import 'package:providerplay/service/z_imports_services.dart';

class EmployeeProvider extends ChangeNotifier {
  bool isLoading = false;

  EmployeeRepository _userRepository = EmployeeRepository();

  ApiResponse<List<EmployeeData>> _employeeList = ApiResponse.none();

  ApiResponse<List<EmployeeData>> get employeeList => _employeeList;

  AddEmployeeResponse addEmployeeResponse;
  CommonResponse deleteEmployeeResponse;

  getEmployeeList(BuildContext context) async {
    _employeeList = ApiResponse.loading("Loading employees");
    notifyListeners();
    try {
      List<EmployeeData> employeesDataList =
          await _userRepository.getEmployeeList(context);
      _employeeList = ApiResponse.completed(employeesDataList);
    } catch (e) {
      print("e  $e");
      _employeeList = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  addEmployee(BuildContext context, var body) async {
    setLoading(true);
    try {
      addEmployeeResponse = await _userRepository.addEmployee(context, body);
    } catch (e) {}
    setLoading(false);
  }

  void setLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }
}
