import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration/profile.dart';
import 'package:registration/reg.dart';
import 'package:registration/scan.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _rollno=TextEditingController();
  final  _password=TextEditingController();

  Future <void> login()async{
    print(_rollno.text);
    print(_password.text);
    Uri url=Uri.parse('https://scnner-web.onrender.com/api/login');

    var response=await http.post(url,
        headers:<String,String>{
        'Content-Type':'application/json; charset=UTF-8',
        },
        body:jsonEncode({'rollno':_rollno.text,'password':_password.text}));
    var decodeData=jsonEncode(response.body);
    print(response.statusCode);
    print(response.body);
    var data=jsonDecode(response.body);
    print(data["message"]);
    if(response.statusCode==200){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Scanner()),
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Roll No',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
               TextField( obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                  labelStyle: TextStyle(color: Colors.white),
                ),),
              SizedBox(height: 20),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,fixedSize: Size(300, 50)),
                  onPressed: (){ login();},
                  child:Text('Log In',style: TextStyle(fontSize: 20,color: Colors.white),)),
              SizedBox(height: 20),
              TextButton(onPressed: (){

                Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Registration()));
              },child:  Text('Dont have an account?Register now',style: TextStyle(color: Colors.white)),
              ),

            ]
            ),
          ),);
  }
}
