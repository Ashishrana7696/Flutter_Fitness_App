
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitneess/exercise_hub.dart';
import 'package:fitneess/exercise_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
   String title="Ashish Fitness";
}

class _homePageState extends State<homePage> {
  final String apiURL =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub exerciseHub;
 

  @override
  void initState() {
    getExercises();
    super.initState();
  }

  void getExercises() async {
    var response = await http.get(
        "https://raw.githubusercontent.com/Ashishrana7696/pro/master/js.json");
    var body = response.body;
    var decodedJson = jsonDecode(body);
    exerciseHub = ExerciseHub.fromJson(decodedJson);
    setState(() {});
    //  print
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: new Center(child: new Text(widget.title, textAlign: TextAlign.center)),
      leading: new IconButton(
          icon: new Icon(Icons.accessibility),
          onPressed: () {
            Navigator.pop(context);
          },)
        
      ),
      body: Container(
        child: exerciseHub != null
            ? ListView(
                children: exerciseHub.exercises.map((f) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) =>ExerciseStartScreen(exercises:f)));
                    },
                    child: Hero(
                      tag: f.id,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:
                                  CachedNetworkImage(
                                        imageUrl: f.thumbnail,
                                        placeholder: (context, url) => Image(
                                          image: AssetImage("assets/my.jpg"),
                                          fit: BoxFit.cover,
                                          height: 250,
                                          
                                          width: MediaQuery.of(context).size.width,
                                        ),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                        fit:BoxFit.cover,
                                        height: 250,
                                        width:MediaQuery.of(context).size.width,
                                       
                                    ),
                                  //  FadeInImage(
                                  //   image: NetworkImage(f.thumbnail),
                                  //   placeholder: AssetImage("assets/my.jpg"),
                                  //   width: MediaQuery.of(context).size.width,
                                  //   height: 250,
                                  //   fit: BoxFit.cover,
                                  // )
                                  ),
                              // ClipRect(
                              //   //  borderRadius:BorderRadius.circular(10),
                              //   child: Container(
                              //     width: MediaQuery.of(context).size.width,
                              //     height: 250,
                              //     decoration: BoxDecoration(
                              //       gradient: LinearGradient(
                              //           colors: [
                              //             Color(0xFF000000),
                              //             Color(0x000000000)
                              //           ],
                              //           begin: Alignment.bottomCenter,
                              //           end: Alignment.center),
                              //     ),
                              //   ),
                              // ),
                              Container(
                                  height: 250,
                                  padding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(f.title,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)))
                            ],
                          )),
                    ),
                  );
                }).toList(),
              )
            : LinearProgressIndicator(),
      ),
    );
  }
}
