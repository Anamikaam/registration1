import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Column(children: [
          SizedBox(height: 200),
          CircleAvatar(
            radius: 40,
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
          Text(
            'Aamii',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Icon(Icons.phone),
                Text('+91 9182736450'),
                SizedBox(height: 20,),

              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Icon(Icons.mail),
                Text('anamika@gmail.com'),
              ],
            ),
          )
        ]));
  }
}
