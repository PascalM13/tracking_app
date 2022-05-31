import 'package:flutter/material.dart';

import '../index/allscreens.dart';

//Sign-up-screen:
//TODO: alle Kästchen und der Knopf müssen weiter hoch, sonst gibt es u.U. Probleme mit der Tastatur
class MyRegistrationPage extends StatelessWidget {
  final _formKeySignUp = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign up'),
      ),
      body: Form(
        key: _formKeySignUp,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'First name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please let us know your first name!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Last name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please let us know your last name!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please let us know your email address!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please let us know your password!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  //TODO: in Zukunft müssen hier die Anmeldedaten gespeichert werden, um sie im Login prüfen zu können
                  if (_formKeySignUp.currentState!.validate()) {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyDashboardPage()));
                  } else {
                    print('not validate');
                  }
                },
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
