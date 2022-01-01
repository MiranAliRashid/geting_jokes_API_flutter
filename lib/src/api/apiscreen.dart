import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class apiscreen extends StatefulWidget {
  apiscreen({Key? key}) : super(key: key);

  @override
  _apiscreenState createState() => _apiscreenState();
}

class _apiscreenState extends State<apiscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: FutureBuilder<List<dynamic>>(
            future: getjoke(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                //  todo: show a loading widget
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // show an error
                return Text(snapshot.error.toString());
              } else {
                //show  jokes
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      //made my own card widget class
                      return myCard(snapshot.data![index]);
                    });
              }
            },
          ),
        ));
  }

  Future<List<dynamic>> getjoke() async {
    //api url
    String Url = "https://v2.jokeapi.dev/joke/Any?type=single&amount=8";
    http.Response response = await http.get(Uri.parse(Url));

    // decode the json body to a list<dynamic>
    //List decodedJson = jsonDecode(response.body);
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    var jokes = [];
    for (var joke in decodedJson['jokes']) {
      jokes.add(joke['joke']);
    }
    return jokes;
  }

  Widget myCard(String index) {
    return (Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Text(index),
    ));
  }
}
