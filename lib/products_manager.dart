import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> _product;
  final Function addProduct, deleteProduct;

  ProductManager(this._product, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: ProductControl(addProduct),
          margin: EdgeInsets.all(5.0),
        ),
        Expanded(
            child: Products(
          _product,
          deleteProduct: deleteProduct,
        )),
      ],
    );
  }
}
