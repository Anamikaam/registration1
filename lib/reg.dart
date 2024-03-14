import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Name',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Roll No',
                      labelStyle: TextStyle(color: Colors.white),
                    ),),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Email',
                      labelStyle: TextStyle(color: Colors.white),
                    ),),
                  SizedBox(height: 20),
                  const TextField( obscureText: true,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(color: Colors.white),
                    ),),
                  SizedBox(height: 20),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,fixedSize: Size(300, 50)),
                      onPressed: (){();},
                      child:Text('Log In',style: TextStyle(fontSize: 20,color: Colors.white),)),
                ]),
          ),
        );
  }
}

