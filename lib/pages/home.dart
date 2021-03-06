import 'package:flutter/material.dart';
import '../products_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> _products;

  HomePage(this._products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("Choose"),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text("Manage Products"),
              onTap: () => Navigator.pushReplacementNamed(context, '/admin'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ProductManager(_products),
    );
  }
}
