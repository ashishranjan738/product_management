import "package:flutter/material.dart";
import "./products_manager.dart";

main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreenAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: ProductManager()
      ),
    );
  }
}
