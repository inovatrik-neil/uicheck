import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StateCheck extends StatefulWidget {
  const StateCheck({Key? key}) : super(key: key);

  @override
  _StateCheckState createState() => _StateCheckState();
}

class _StateCheckState extends State<StateCheck> {

  int number = 0;

  List<int> bin = [1,4, 8,10,11,14,16,20,24,30];
  int left = 0;
  late int right, mid, steps ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    steps = 0;
    right = bin.length - 1;


    bool isFound = binary(bin, 11);

    String show = isFound ? 'Found': 'Not Found';
    print(show);

   int isThere = binarySearch(bin, 12);
   print(isThere);



  }

  bool binary(List<int> binList, int target){

    while(left <= right ){
      mid = (left + right)~/2;
      steps = steps+1;
      if(binList[mid] == target){
        print(steps);
        return true;
      }else if(target < binList[mid]){
        right = mid - 1;
      }else{
        left = mid + 1;
      }
    }
    return false;

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            SizedBox(height: 20),
            Container(
              height: 100,
              padding:EdgeInsets.all(10),
              child:Stack(
                children: <Widget>[
                  Positioned(
                    top: 30,
                    left: 30,
                    height:150,
                    width: 150,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green[300],
                      child: Text(
                        'Green',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left:60,
                    width: 150,
                    height: 150,
                    child: Container(
                      width:50,
                      height:50,
                      color: Colors.red[400],
                      child: Text(
                        'Red',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    width: 150,
                    height: 150,
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.purple[300],
                      child: Text(
                        'Purple',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50,),
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue,
              child: const Align(
                alignment: Alignment.center,
                child: Image(image: AssetImage("assets/images/cart.png"),
                height: 50,
                width: 50,),
              ),
            ),
            SizedBox(height: 50,),
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
                          // print('Hii');

                          // setState(() {
                          // number = number +1;
                          // print(number);
                          // });
                        },
                        label: Text('Send',
                          style: TextStyle(color: Colors.white) ,),
                        icon: const Icon(Icons.navigation),


                      ),

                    ]
                )
            ),

          ]),
        ),
      ),
    );
  }
}
