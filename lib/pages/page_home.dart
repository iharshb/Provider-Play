import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerplay/pages/page_addname.dart';
import 'package:providerplay/providers/navigation_provider.dart';
import 'package:providerplay/widgets/menu_icon.dart';
import 'package:providerplay/widgets/slide_background.dart';

import '../providers/name_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: MenuIconWidget(onTap: () {
          Scaffold.of(context).openDrawer();
        }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddNamePage(),
                        fullscreenDialog: true));
              })
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: 1, color: Colors.grey)),
        child: Consumer<NamesProvider>(builder: (context, nameProvider, _) {
          if (nameProvider.nameList.length > 0) {
            return namesListWidget(nameProvider);
          } else {
            return noNamesWidget();
          }
        }),
      ),
    );
  }

  ListView namesListWidget(NamesProvider nameProvider) {
    return ListView.separated(
      physics: ScrollPhysics(),
      itemCount: nameProvider.nameList.length,
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey, thickness: 1.1, height: 1);
      },
      itemBuilder: (context, index) {
        return nameListTile(nameProvider, index, context);
      },
    );
  }

  Center noNamesWidget() {
    return Center(
      child: Container(
          child: Text(
        "No Names Found. \n\n Please add new names.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black87,
        ),
      )),
    );
  }

  Widget nameListTile(
      NamesProvider nameProvider, int index, BuildContext context) {
    return Dismissible(
      key: Key(nameProvider.nameList[index].toString()),
      background: SlideBackground(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content: const Text("Are you sure you wish to remove this Name?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () async {
                      Navigator.of(context).pop(false);

                      nameProvider.deleteName(nameProvider.nameList[index]);
                    },
                    child: const Text("REMOVE")),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCEL"),
                ),
              ],
            );
          },
        );
      },
      child: ListTile(
        dense: true,
        title: Text(
          nameProvider.nameList[index].toString(),
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
      ),
    );
  }
}
