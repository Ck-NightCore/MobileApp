import 'package:flutter/material.dart';
import 'model.dart';

class MyMain extends StatefulWidget {
  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String major = "";
  String email = "";
  String phone = "";
  String address = "";
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Employee")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                onSaved: (v) => name = v!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                onSaved: (v) => age = int.parse(v!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Major"),
                onSaved: (v) => major = v!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onSaved: (v) => email = v!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Phone"),
                onSaved: (v) => phone = v!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Address"),
                onSaved: (v) => address = v!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Save"),
                onPressed: () {
                  _formKey.currentState!.save();

                  Employee emp = Employee(
                    name: name,
                    age: age,
                    major: major,
                    email: email,
                    phone: phone,
                    address: address,
                  );

                  print(emp.toJson()); // ทดสอบก่อนส่ง DB
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
