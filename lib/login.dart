import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Center(
              child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ),
          backgroundColor: Colors.teal,
          body: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 40),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Roll No',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              const TextField( obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                  labelStyle: TextStyle(color: Colors.white),
                ),),
              SizedBox(height: 20),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,fixedSize: Size(300, 50)),
                  onPressed: (){ ();},
                  child:Text('Log In',style: TextStyle(fontSize: 20,color: Colors.white),)),
              SizedBox(height: 20),
              Text('Dont have an account?Register now',style: TextStyle(color: Colors.white)),
            ]
            ),
          ),);
  }
}
