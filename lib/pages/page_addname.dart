import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerplay/providers/navigation_provider.dart';
import 'package:providerplay/providers/name_provider.dart';

class AddNamePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Name"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidate: Provider.of<NamesProvider>(context).autoValidate,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:
                    InputDecoration(hintText: " Name", labelText: "Name"),
                controller: nameController,
                validator: validateName,
              ),
              SizedBox(height: 40),
              submitButton(context, navigation)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox submitButton(BuildContext context, NavigationProvider navigation) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(14),
        child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold)),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        elevation: 0.1,
        onPressed: () async {
          validateInputs(context, navigation);
        },
      ),
    );
  }

  void validateInputs(
      BuildContext context, NavigationProvider navigation) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      await Provider.of<NamesProvider>(context, listen: false)
          .addNewName(nameController.text.trim());

      Navigator.pop(context);
    } else {
      await Provider.of<NamesProvider>(context, listen: false)
          .setValidate(true);
    }
  }

  String validateName(String value) {
    if (value.length == 0) {
      return "Enter name";
    }
    return null;
  }
}
