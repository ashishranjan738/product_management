import 'package:flutter/material.dart';
import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> _product;

  ProductManager(this._product);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Products(
          _product,
        )),
      ],
    );
  }
}
