import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title, image;
  ProductPage(this.title, this.image);

  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure ?"),
          content: Text("This cannot be undone !"),
          actions: <Widget>[
            FlatButton(
              child: Text("Discard"),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("BackButtonPressed");
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(title),
            ),
            RaisedButton(
              padding: EdgeInsets.all(10.0),
              child: Text("DELETE"),
              onPressed: () => _showWarningDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
