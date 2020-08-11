import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Bmi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BmiState();
  }

}

class BmiState extends State<Bmi> {

  final TextEditingController _age =new TextEditingController();
  final TextEditingController _height =new TextEditingController();
  final TextEditingController _weight =new TextEditingController();
  double result =0.0;
  String _result ="";

  void _calculatebmi(){
setState(() {


    int age = int.parse(_age.text);
    double height = double.parse(_height.text);
    double weight = double.parse(_weight.text);


    if((_age.text.isNotEmpty || age >0) && (_height.text.isNotEmpty || height>0) &&
        (_weight.text.isNotEmpty || weight>0)){
      result = (weight/(height*height))*10000;
    }
    if(result<18.5){
      _result ="Underweight";
    }
    else if(result>=18.5 && result<25.0){
      _result ="Normal";
    }
    else if(result>=25.0 && result<30.0){
      _result ="OverWeight";
    }
    else if(result>=30.0){
      _result ="Obese";
    }
});
  }







  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("BMI",
        style: new TextStyle(
          fontSize: 28
        ),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Image.asset('images/bmi.png',
            height: 100.0,
            width: 150,),
            new Container(
              margin: const EdgeInsets.all(10.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Enter your Age',
                    hintText: 'Age',
                      icon: new Icon(Icons.person_outline),),
                  ),
                  new TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Height',
                      hintText: 'In cm',
                      icon: new Icon(Icons.insert_chart)
                    ),
                  ),
                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight',
                        hintText: 'In Kg',
                        icon: new Icon(Icons.line_weight)
                    )
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Container(
                   child: new RaisedButton(
                        onPressed:_calculatebmi,
                    color:Colors.deepPurpleAccent,
                   child:new Text("Calculate", ),
                   textColor: Colors.white,)
                  ),
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(10.0)),
            new Column(
              children: <Widget>[
                new Text("Your BMI: $result",
                style: new TextStyle(
                    color:Colors.pinkAccent,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new Text("$_result",
                  style: new TextStyle(
                      color:Colors.deepPurpleAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),),
              ],
            ),
          ],
        ),

      ),
    );
  }
}