import 'package:flutter/material.dart';

class MenuIconWidget extends StatelessWidget {
  Function onTap;
  MenuIconWidget({this.onTap});
  @override
  Widget build(BuildContext context) {
    return leadingIconWidget(context);
  }

  Padding leadingIconWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }
}
