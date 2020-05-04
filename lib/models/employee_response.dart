import 'dart:convert';

EmployeeResponse employeeResponseFromJson(String str) =>
    EmployeeResponse.fromJson(json.decode(str));

String employeeResponseToJson(EmployeeResponse data) =>
    json.encode(data.toJson());

class EmployeeResponse {
  String status;
  List<EmployeeData> data;

  EmployeeResponse({
    this.status,
    this.data,
  });

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      EmployeeResponse(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<EmployeeData>.from(
                json["data"].map((x) => EmployeeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EmployeeData {
  String id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  EmployeeData({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        id: json["id"] == null ? null : json["id"],
        employeeName:
            json["employee_name"] == null ? null : json["employee_name"],
        employeeSalary:
            json["employee_salary"] == null ? null : json["employee_salary"],
        employeeAge: json["employee_age"] == null ? null : json["employee_age"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "employee_name": employeeName == null ? null : employeeName,
        "employee_salary": employeeSalary == null ? null : employeeSalary,
        "employee_age": employeeAge == null ? null : employeeAge,
        "profile_image": profileImage == null ? null : profileImage,
      };
}
