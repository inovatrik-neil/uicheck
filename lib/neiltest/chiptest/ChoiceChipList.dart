
import 'package:flutter/material.dart';

class ChoiceChipListWidget extends StatefulWidget {
  final List<String> reportList;

  ChoiceChipListWidget(this.reportList);

  @override
  _ChoiceChipListWidgetState createState() => new _ChoiceChipListWidgetState();
}

class _ChoiceChipListWidgetState extends State<ChoiceChipListWidget> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(_buildChoiceChip(item));
    });
    return choices;
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
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
