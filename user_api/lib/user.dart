import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List users;
  Map datas;
  Future setUser() async{  // function name Future waiting data from Request​​​​​ succes or fiale
    String url = "https://reqres.in/api/users"; // store url 
    http.Response response = await http.get(url);
    datas = json.decode(response.body);
    // debugPrint(response.body);
    setState(() {
    //  users = json.decode(response.body); // convert date to array json store into list array "users"
      users = datas["data"];
    });
  }
  @override
  void initState(){ 
    super.initState();
    setUser(); // call function setUser 
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information user"),
      ),
      body: ListView.builder( // this is an loop 

      // if array of "users" store null display 0
      // if array of "users" store not null display all data
        itemCount: users == null ? "can't request it.": users.length, // condition: 
        itemBuilder: (BuildContext context, int i){ // BuildContext context it's keyword for thisplay  on mobile apps
          return Container(
            padding: EdgeInsets.all(20.0),
             child: Row(
               children: <Widget>[
                 CircleAvatar(
                   backgroundImage: NetworkImage("${users[i]["avatar"]}"),
                 ),
                 Text("${users[i]["first_name"]}")
               ],
             ),
          );
        },
      ),
    );
  }
}