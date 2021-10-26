import 'package:flutter/material.dart';
import 'package:uicheck/neiltest/chiptest/ChoiceChipList.dart';
import 'package:uicheck/neiltest/chiptest/ChoiceChipList2.dart';
import 'package:uicheck/neiltest/chiptest/Count.dart';
import 'package:uicheck/neiltest/chiptest/choice_chip_data.dart';
import 'package:uicheck/neiltest/chiptest/choice_chips.dart';
import 'package:uicheck/neiltest/chiptest/fancy_button.dart';

class Week3 extends StatefulWidget {
  const Week3({Key? key}) : super(key: key);

  @override
  _Week3State createState() => _Week3State();
}

class _Week3State extends State<Week3> {
  int? _value = 0;
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  List<String> chipList = [
    "Recycled",
    "Vegetarian",
    "Skilled",
  ];

  final arrarOfChipText = ['All', 'Today', 'Tomorrow', 'This week'];
  String selectedChoice = "";


  List<ChoiceChipData> choiceChips = ChoiceChips.all;
  final double spacing = 8;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            SizedBox(height: 20),
            //1
            // Container(
            //   height: 50,
            //   padding: EdgeInsets.all(10),
            //   child: Stack(
            //     children: <Widget>[
            //       Wrap(
            //         spacing: 20.0,
            //         runSpacing: 20.0,
            //         children: List<Widget>.generate(
            //           3,
            //           (int index) {
            //             return ChoiceChip(
            //               label: Text('Item $index'),
            //               selected: _value == index,
            //               avatar: Image(
            //                   image: AssetImage("assets/images/cart.png")),
            //               onSelected: (bool selected) {
            //                 setState(() {
            //                   _value = selected ? index : null;
            //                 });
            //               },
            //               backgroundColor: Colors.greenAccent,
            //               elevation: 6.0,
            //               shadowColor: Colors.grey[60],
            //               padding: EdgeInsets.all(20.0),
            //             );
            //           },
            //         ).toList(),
            //       ),
            //     ],
            //   ),
            // ),
            ChoiceChipListWidget2(chipList),
            // SizedBox(
            //   height: 50,
            // ),
            // //2
            // Container(
            //     child: Wrap(
            //   spacing: 5.0,
            //   runSpacing: 5.0,
            //   children: <Widget>[
            //     ChoiceChipListWidget(chipList),
            //   ],
            // )),
            SizedBox(
              height: 50,
            ),
            //3
            // Wrap(
            //   children: List<Widget>.generate(
            //     3,
            //     (int index) {
            //       return ChoiceChip(
            //         label: Text('Item $index'),
            //         selected: _value == index,
            //         onSelected: (bool selected) {
            //           setState(() {
            //             _value = selected ? index : null;
            //           });
            //         },
            //       );
            //     },
            //   ).toList(),
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            // FancyButton(
            //   onPressed: () {},
            // ),
            // Count(
            //     count: counter,
            // onCountSelected: () => print("Selected the counter"),
            //   onCountChange: (int val)=> setState(() =>
            //   counter += val),),

            Container(
              height: 40,
              child: ListView.builder(scrollDirection: Axis.horizontal,
                  itemCount: arrarOfChipText.length,
                  itemBuilder: (context, nIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: ChipView(strText: arrarOfChipText[nIndex],
                      //   onClick: () {},),
                      child:  ChoiceChip(
                        label: Text(arrarOfChipText[nIndex]),
                        labelStyle: TextStyle(
                            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Color(0xffededed),
                        selectedColor: Color(0xffffc107),
                        // selected: selectedChoice == arrarOfChipText[nIndex],
                        selected: _value == nIndex,
                        onSelected: (selected) {
                          setState(() {
                            // selectedChoice = arrarOfChipText[nIndex];
                            _value = selected ? nIndex : null;
                          });
                        },
                      ),
                    );
                  }
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //4
            buildChoiceChips(),
          ]),
        ),
      ),
    );


  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }

  Widget buildChoiceChips(){
    return Wrap(
      runSpacing: spacing,
      spacing: spacing,
      children: choiceChips
          .map((choiceChip) => ChoiceChip(
        label: Text(choiceChip.label),
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white),
        onSelected: (isSelected) => setState(() {
          choiceChips = choiceChips.map((otherChip) {
            final newChip = otherChip.copy(isSelected: false);

            return choiceChip == newChip
                ? newChip.copy(isSelected: isSelected)
                : newChip;
          }).toList();
        }),
        selected: choiceChip.isSelected,
        selectedColor: Colors.green,
        backgroundColor: Colors.blue,
      ))
          .toList(),
    );
  }
}

