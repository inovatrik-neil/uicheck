

import 'package:flutter/material.dart';

class Week2 extends StatefulWidget {
  const Week2({Key? key}) : super(key: key);

  @override
  _Week2State createState() => _Week2State();
}

class _Week2State extends State<Week2> {
  FixedExtentScrollController fixedExtentScrollController =
  new FixedExtentScrollController();

  List<Widget> items = [
    ListTile(
      leading: Icon(Icons.local_activity, size: 50),
      title: Text('Activity'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_airport, size: 50),
      title: Text('Airport'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_atm, size: 50),
      title: Text('ATM'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_bar, size: 50),
      title: Text('Bar'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_cafe, size: 50),
      title: Text('Cafe'),
      subtitle: Text('Description here'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
    child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                    textDirection: TextDirection.ltr,
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        color: Colors.blue,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.green,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        color: Colors.yellow,
                      )
                    ]
                ),

              ]),
        ),
        SizedBox(height: 10),
        Container(
          height: 300,
          child: ListWheelScrollView(
              controller: fixedExtentScrollController,
              physics: FixedExtentScrollPhysics(),
              itemExtent: 75,
              children: items
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.all(30),
          height: 300,
          width: 200,

          child: Column(
            children: <Widget>[

              Expanded(
                flex: 10,
                child: Container(
                  color: Colors.amber,
                ),
              ),

              Expanded(
                flex: 20,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.all(30),
          height: 100,
          width: 250,
          color: Colors.black,
          child:Wrap(
            spacing: 8,
            runSpacing: 10,
            children: <Widget>[
              Container(
                width: 70,
                height: 30,
                color: Colors.blue,
              ),
              Container(
                width: 70,
                height: 30,
                color: Colors.green,
              ),
              Container(
                width: 70,
                height: 30,
                color: Colors.yellow,
              ),
              Container(
                width: 70,
                height: 30,
                color: Colors.red,
              )
            ],
          ),
        ),

        SizedBox(height: 30,),
        Container(
          height: 100,
          width: 200,
          color: Colors.yellow,
          child: Column(
            children:[
              FloatingActionButton.extended(
                foregroundColor: Colors.red,
                backgroundColor: Colors.blue,
                elevation: 20,
                onPressed: () {
                  // Add your onPressed code here!
                },
                label: Text('Send',
                  style: TextStyle(color: Colors.white) ,),
                icon: const Icon(Icons.navigation),

              ),

            ]
          )
        ),

        SizedBox(height: 30,)



      ],
    )),
    ),

    );
  }
}
