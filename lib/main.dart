import "package:flutter/material.dart";
import "pages/home.dart";
import "pages/products_admin.dart";
import "pages/product.dart";
import "pages/auth.dart";

main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void addProduct(Map<String, dynamic> item) {
    setState(() {
      _products.add(item);
      print(_products);
    });
  }

  void deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreenAccent,
      ),
      // home: LoginPage(),
      routes: {
        '/': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(_products),
        '/admin': (BuildContext context) =>
            ProductsAdminPage(addProduct, deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");
        if (pathElements.length != 3 ||
            pathElements[0] != '' ||
            pathElements[1] != 'product') {
          return null;
        }
        final int index = int.parse(pathElements[2]);

        return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']));
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage(_products),
        );
      },
    );
  }
}
