import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> _products;
  final Function deleteProduct;
  Products(this._products, {this.deleteProduct});

  Widget _listWidegetBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(_products[index]['image']),
          Container(
            child: Text(_products[index]['title']),
            padding: EdgeInsets.all(10.0),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.pushNamed<bool>(
                            context, "/product/" + index.toString())
                        .then(
                      (bool value) {
                        if (value) {
                          deleteProduct(index);
                        }
                      },
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _products.length > 0
        ? ListView.builder(
            itemBuilder: _listWidegetBuilder,
            itemCount: _products.length,
          )
        : Center(
            child: Text("No Products Found, Please add some"),
          );
  }
}
