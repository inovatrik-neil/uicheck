
import 'package:flutter/material.dart';
import 'package:uicheck/neiltest/chiptest/ChipView.dart';
import 'package:uicheck/neiltest/chiptest/choice_chip_data.dart';
import 'package:uicheck/neiltest/chiptest/choice_chips.dart';

class ChoiceChipListWidget2 extends StatefulWidget {
  final List<String> reportList;
  List<ChoiceChipData> choiceChips = ChoiceChips.all;

  ChoiceChipListWidget2(this.reportList);

  @override
  _ChoiceChipListWidgetState2 createState() => new _ChoiceChipListWidgetState2();

}

class _ChoiceChipListWidgetState2 extends State<ChoiceChipListWidget2> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(_buildChoiceChip(item));
    });
    return choices;
  }

  Widget buildChoiceChips(){
    return Wrap(
      runSpacing: 5,
      spacing: 5,
      children: widget.choiceChips
          .map((choiceChip) => ChoiceChip(
        label: Text(choiceChip.label),
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white),
        onSelected: (isSelected) => setState(() {
          widget.choiceChips = widget.choiceChips.map((otherChip) {
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

  Widget _buildChoiceChip(String item) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: Text(item),
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xffededed),
        selectedColor: Color(0xffffc107),
        selected: selectedChoice == item,
        onSelected: (selected) {
          setState(() {
            selectedChoice = item;
          });
        },
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildChoiceChips(),
          SizedBox(height: 20,),
          Container(
            height: 50,
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: widget.reportList.length,
                itemBuilder: (context, nIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChipView(strText: widget.reportList[nIndex],
                      onClick: () {},),
                  );
                }
            ),
          ),

          SizedBox(height: 20,),
          Wrap(
            children: _buildChoiceList(),
          ),
        ],
      )
    );
  }
}
