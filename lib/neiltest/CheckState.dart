
import 'package:flutter/material.dart';
import 'package:uicheck/neiltest/chiptest/Count.dart';

class CheckState extends StatelessWidget {
  const CheckState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = 10;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            // FancyButton(
            //   onPressed: () {},
            // ),
            Count(
                count: counter,
                onCountSelected: () => print("Selected the counter"),
                onCountChange: (int val)=>
                {counter = val,
                    print(counter)}),


          ]),
        ),
      ),
    );


  }
}
