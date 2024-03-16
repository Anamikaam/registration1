import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:registration/login.dart';
import 'package:registration/scan.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _name=TextEditingController();
  TextEditingController _rollno=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _pswrd=TextEditingController();

  void register()async{
    print(_name.text);
    print(_rollno.text);
    print(_email.text);
    print(_pswrd.text);
    Uri uri=Uri.parse('https://scnner-web.onrender.com/api/register');
    var response=await http.post(uri,
    headers:<String,String>{
      'Content-Type':'application/json; charset=UTF-8',
    },
    body:jsonEncode({
      'name': _name.text,
      'email': _email.text,
      'rollno': _rollno.text,
      'password': _pswrd.text,
    }));
    print(response.statusCode);
    print(response.body);
    var data=jsonDecode(response.body);
    print(data["message"]);
    if(response.statusCode==200){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Center(
              child: Text('Registration',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ),
          backgroundColor: Colors.teal,
          body:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _name,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Name',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _rollno,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Roll No',
                      labelStyle: TextStyle(color: Colors.white),
                    ),),
                  SizedBox(height: 20),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Email',
                      labelStyle: TextStyle(color: Colors.white),
                    ),),
                  SizedBox(height: 20),
                  TextField(
                    controller: _pswrd,
                    obscureText: true,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(color: Colors.white),
                    ),),
                  SizedBox(height: 20),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,fixedSize: Size(300, 50)),
                      onPressed: (){setState(() {register();

                      }); },
                      child:Text('Log In',style: TextStyle(fontSize: 20,color: Colors.white),)),
                ]),
          ),
        );
  }
}

