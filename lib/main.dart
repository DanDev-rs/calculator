import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homebrew calculator',
      home: ActionPage (),
    );
  }
}

class ActionPage extends StatefulWidget {
  @override
  _ActionPageState createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  int input1 = 0;
  int input2 = 0;
  double result = 0;
  String actionType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               TextField(decoration: InputDecoration(labelText: "Input 1"),
               onChanged: (String a){
                input1 = a as int;
               },
               ),
               TextField(decoration: InputDecoration(labelText: "Input 2") ,
               onChanged: (String b){
                 input2 = b as int;
               },
               ),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(child: Text("+"), 
              onPressed: () {
                result = (input1 + input2) as double;
                actionType = "+";
              } ,),
              FlatButton(child: Text("-"), 
              onPressed: () {
                result = (input1 - input2) as double;
                actionType = "-";
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ResultPage(input1: input1, input2: input2,)));     
              } ,),
              FlatButton(child: Text("*"), 
              onPressed: () {
                result = (input1 * input2) as double;
                actionType = "*";
              } ,),
              FlatButton(child: Text("/"), 
              onPressed: () {
                result = (input1 / input2);
                actionType = "/";
              } ,),
              FlatButton(child: Text("^"), 
              onPressed: () {
                for (int c = input2; c != 0; c--){
                  result = (input1 * input1) as double;
                }
                actionType = "^";
              } ,),
            ],
           )
         ],
      ),
    );
  }
}



class ResultPage extends StatelessWidget {
  final int input1;
  final int input2;
  final double result;
  final String actionType;
  const ResultPage({Key key, this.input1, this.input2, this.result, this.actionType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("$input1 $actionType $input2 = $result")
        ],
      ),
    );
  }
}
