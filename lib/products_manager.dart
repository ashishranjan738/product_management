import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String _initialItem;

  ProductManager(this._initialItem);

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    _products.add(widget._initialItem);
    super.initState();
  }

  void addProducts(String item) {
    setState(() {
      _products.add(item);
      print(_products);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Container(
              child: ProductControl(addProducts),
              margin: EdgeInsets.all(5.0),
            ),
            Products(_products),
          ],
        );
  }
}