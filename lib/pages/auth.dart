import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  bool _acceptTerm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String newValue) {
                setState(() {
                  _email = newValue;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (String newValue) {
                setState(() {
                  _password = newValue;
                });
              },
            ),
            SwitchListTile(
              value: _acceptTerm,
              onChanged: (bool newValue) {
                setState(() {
                  _acceptTerm = newValue;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            )
          ],
        ),
      ),
    );
  }
}
