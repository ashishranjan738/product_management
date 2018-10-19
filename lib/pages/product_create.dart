import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);  
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String productName = '', productDescription = '';
  double productPrice = 0.00;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Product Title"),
            autocorrect: true,
            autofocus: true,
            onChanged: (String textValue) {
              productName=textValue;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Product Description"),
            maxLines: 4,
            autocorrect: true,
            autofocus: true,
            onChanged: (String textValue) {
              productDescription=textValue;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Product Price"),
            autocorrect: true,
            autofocus: true,
            keyboardType: TextInputType.number,
            onChanged: (String textValue) {
              productPrice=double.parse(textValue);
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text("Save"),
            onPressed: () {
              final Map<String,dynamic> item = {
                  'title':productName,
                  'description': productDescription,
                  'image': 'assets/food.jpg',
                  'price': productPrice
              }; 

              widget.addProduct(item); 
              Navigator.pushReplacementNamed(context, "/home");
            }
          )
        ],
      ),
    );
  }
}
