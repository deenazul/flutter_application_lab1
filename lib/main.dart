import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//class untuk dropdown sex
class Sex {
  int value;
  String sex;
  Sex(this.value, this.sex);

  static List<Sex> getSex() {
    return <Sex>[Sex(1, "Male"), Sex(2, "Female")];
  }
  //return array
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int nvalue = 1;
  int age;
  double height, weight, waistC;
  double absi = 0.0;

//use this to get textfield value
  TextEditingController ageTextEditingController = new TextEditingController();
  TextEditingController heightTextEditingController =new TextEditingController();
  TextEditingController weightTextEditingController =new TextEditingController();
  TextEditingController waistCTextEditingController =new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABSI Calculator',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'ABSI Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        
        body: SingleChildScrollView(
            child: Center(
          child: Container(
            color: Colors.white30, //bground color

            child: Container(
              child: Column(children: [
                
                SizedBox(
                  height: 45,
                ),
                Row(
                    //row 1 sex 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                     
                      Text(
                        "Sex",
                        style: TextStyle(fontSize: 17,), 
                      ), // text sex
                      SizedBox(width: 65,),
                      Container(
                        
                          width: 150,
                          alignment: Alignment.center,
                          child: DropdownButton(
                            value: nvalue,
                            items: [
                              DropdownMenuItem(
                                child: Text("Male"),
                                value: 1,
                              ), //dropdownmenuitem 1
                              DropdownMenuItem(
                                child: Text("Female"),
                                value: 2,
                              ) //dropdownmenuitem 2
                            ],
                            onChanged: (value) {
                              setState(() {
                                nvalue = value;
                              });
                            },
                          )) //dropdownbutton //container
                    ]), // <Widget>[] //row
                
                Row(
                    //row 2 age
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(fontSize: 17),
                      ), // text age
                      SizedBox(width: 61,),
                      Container(
                        width: 148,
                        child: TextField(
                          controller: ageTextEditingController, //retrieve value
                        ), //textfield age
                        alignment: Alignment.centerRight,
                      ), //container
                    ]),//row
                Row(
                    //row 3 height
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Height(m)",
                        style: TextStyle(fontSize: 17),
                      ), //text height
                      SizedBox(width: 13,),
                      Container(
                        width: 150,
                        child: TextField(
                          controller: heightTextEditingController,
                        ), //textfield height
                        alignment: Alignment.center,
                      ), //container
                    ]), //row
                Row(
                    //row 4 weight 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Weight(kg)",
                        style: TextStyle(fontSize: 17),
                      ), //text
                      SizedBox(width: 13,),
                      Container(
                        width: 150,
                        child: TextField(
                          controller: weightTextEditingController,
                        ), //textfield weight
                        alignment: Alignment.center,
                      ) //container
                    ]), //row
                SizedBox(
                  height: 10,
                ),
                Row(
                    //row 5: waistC
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Waist\nCircumference\n(cm)",
                        style: TextStyle(fontSize: 17),
                      ), //Text
                      SizedBox(width: 2,),
                      Container(
                        width: 150,
                        child: TextField(
                          controller: waistCTextEditingController,
                        ), //Textfield waistC
                        alignment: Alignment.center,
                      ) //Container
                    ]), //Row waistC
                SizedBox(
                  height: 80,
                ),
               
                MaterialButton(
                  color: Colors.blue,
                  child: new Text(
                    'SHOW RESULT',
                    style: TextStyle(fontSize: 20,),
                  ), //Text Show Result
                  onPressed: calcABSI,
                ), //MaterialButton
                SizedBox(
                  height: 20,
                  ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "ABSI Score:\t\t\t $absi",
                        style: TextStyle(fontSize: 18),
                      ), //Text Score
                    ]), //Row Score
                SizedBox(
                  height: 35,
                ), //SizedBox
              ]), //Column
            ), //Container
          ),//Container
        )),// Center //SingleChildScrollView
      ),//Scaffold
    ); //MaterialApp
  }

  //calc absi
  calcABSI() {
    setState(() {
      double height = double.parse(heightTextEditingController.text);
      double weight = double.parse(weightTextEditingController.text);
      double waistC = double.parse(waistCTextEditingController.text);
      double scoreBMI = weight / (height * height);
      double finalBMI = pow(scoreBMI, 2 / 3);
      double absiHeight = pow(height, 1 / 2);
      absi = ((waistC / (finalBMI * absiHeight))) / 100;
    });
  }
}
