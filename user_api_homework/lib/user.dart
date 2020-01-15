
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List users; // create array 
  Map userData;

  // step 2
  Future setUser() async {
    String url ="https://pixabay.com/api/?key=14001068-da63091f2a2cb98e1d7cc1d82&q=beautiful&image_type=photo&pretty=true";
    http.Response response = await http.get(url);
    userData = json.decode(response.body);
// step 3 with create array
    setState(() { 
     users = userData["hits"];
    });
    debugPrint(response.body);
  }

  // to do call function setUser();
  @override
  void initState() {
    setUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int i){
          final storeUser = users[i];
          return Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("${storeUser["userImageURL"]}"),
                        
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text("${storeUser["user"]}", style: TextStyle(fontSize: 20.0, color: Colors.blue),),
                    ),
                  ],
                ),
                Container(
                  child: Image.network("${storeUser["largeImageURL"]}"),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}