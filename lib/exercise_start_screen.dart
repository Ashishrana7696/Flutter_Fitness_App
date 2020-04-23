import 'package:fitneess/exercise_hub.dart';
import 'package:fitneess/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
class ExerciseStartScreen extends StatefulWidget {
  
final Exercises exercises;
ExerciseStartScreen({this.exercises});
  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds=10;
  bool _allow=true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(_allow);
      },
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Hero(
          tag:widget.exercises.id,

          child: Stack(
                    children:<Widget>[
                       Image(image: NetworkImage(widget.exercises.thumbnail),
              width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit:BoxFit.cover
            
            
            ),
            Positioned(
              bottom: 40,
              left:0,
              right:0,
                        child: Container(
           
                height: 200,
                width:200,
                child:SleekCircularSlider(
                          appearance: CircularSliderAppearance(),
                          onChange: (double value) {

                            seconds=value.toInt();
                            
                          },
                          initialValue: 30,
                          min:10,
                          max:60,
                          innerWidget: (v){
                            return Container(
                              alignment: Alignment.center,
                              child: Text("${ v.toInt()} Sec",
                              style: TextStyle(
                                color:Colors.white,
                                decoration:TextDecoration.none,
                                fontSize:20
                              ),
                              ),
                            );
                          },
                          )
              ),
            ),
            Container(
              alignment: Alignment.center,
              child:RaisedButton(
                onPressed: (){

Navigator.push(context,
 MaterialPageRoute(builder: (context) => ExerciseScreen(
   exercises:widget.exercises,
   seconds: seconds,
 )
 )
 );


                },
                child: Text("start exercise"),
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20)
                ),
                splashColor: Colors.black,
              )
            )
            ],
          )
          ),
          
          ),
    );
       
  }
  }
