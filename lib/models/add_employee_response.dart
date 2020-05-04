// To parse this JSON data, do
//
//     final addEmployeeResponse = addEmployeeResponseFromJson(jsonString);

import 'dart:convert';

AddEmployeeResponse addEmployeeResponseFromJson(String str) =>
    AddEmployeeResponse.fromJson(json.decode(str));

String addEmployeeResponseToJson(AddEmployeeResponse data) =>
    json.encode(data.toJson());

class AddEmployeeResponse {
  String status;
  Data data;

  AddEmployeeResponse({
    this.status,
    this.data,
  });

  factory AddEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      AddEmployeeResponse(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  String name;
  String salary;
  String age;
  int id;

  Data({
    this.name,
    this.salary,
    this.age,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"] == null ? null : json["name"],
        salary: json["salary"] == null ? null : json["salary"],
        age: json["age"] == null ? null : json["age"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "salary": salary == null ? null : salary,
        "age": age == null ? null : age,
        "id": id == null ? null : id,
      };
}
