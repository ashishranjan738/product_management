import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> _products;

  Products(this._products);

  Widget _listWidegetBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/food.jpg"),
          Text(_products[index]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _products.length>0 ? ListView.builder(
      itemBuilder: _listWidegetBuilder,
      itemCount: _products.length,
    ):Center(child: Text("No Products Found, Please add some"),);
  }
}
