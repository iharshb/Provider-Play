import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerplay/models/add_employee_response.dart';
import 'package:providerplay/pages/page_add_employee.dart';
import 'package:providerplay/providers/employee_provider.dart';
import 'package:providerplay/service/z_imports_services.dart';
import 'package:providerplay/widgets/menu_icon.dart';
import 'package:providerplay/widgets/progressview.dart';
import 'package:providerplay/widgets/slide_background.dart';

class EmployeesPage extends StatefulWidget {
  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage>
    with AfterLayoutMixin<EmployeesPage> {
  @override
  void afterFirstLayout(BuildContext context) {
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        leading: MenuIconWidget(onTap: () {
          Scaffold.of(context).openDrawer();
        }),
      ),
      body: ProgressWidget(
        opacity: 0.6,
        isShow: Provider.of<EmployeeProvider>(context).isLoading,
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              employeeListWidget(),
              addEmployeeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded employeeListWidget() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Consumer<EmployeeProvider>(builder: (context, userProvider, _) {
          switch (userProvider.employeeList.status) {
            case Status.LOADING:
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                  width: 50,
                  height: 50,
                ),
              );
              break;
            case Status.COMPLETED:
              return ListView.separated(
                physics: ScrollPhysics(),
                itemCount: userProvider.employeeList.data.length,
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey, thickness: 1.1, height: 1);
                },
                itemBuilder: (context, index) {
                  return empListTile(userProvider, index, context);
                },
              );
              break;
            case Status.ERROR:
              return Center(
                child: Container(
                    child: Text(
                  "Something went wrong.\n\n Please try again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                )),
              );
              break;
            default:
              return Container();
              break;
          }
        }),
      ),
    );
  }

  SizedBox addEmployeeButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(14),
        child:
            Text("Add Employee", style: TextStyle(fontWeight: FontWeight.bold)),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        elevation: 0.1,
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddEmployeePage(),
                  fullscreenDialog: true));
        },
      ),
    );
  }

  Widget empListTile(
      EmployeeProvider userProvider, int index, BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        userProvider.employeeList.data[index].employeeName,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14,
      ),
    );
  }

  void getUserData() async {
    await Provider.of<EmployeeProvider>(context, listen: false)
        .getEmployeeList(context);
  }
}
