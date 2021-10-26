import 'package:flutter/material.dart';

class ChipView extends StatefulWidget {
  final String strText;
  final VoidCallback onClick;
  final bool bSelected;
  final bool bAutoFocus;

  const ChipView({ Key? key,
    required this.strText,
    this.onClick = _defaultFunction,
    this.bSelected = false,
    this.bAutoFocus = false
  })
      : super(key: key);
  _ChipViewState createState() => _ChipViewState();

  static _defaultFunction() {
    // Does nothing
  }
}

class _ChipViewState extends State<ChipView> {
  bool bInit = true;
  bool _bSelected = false;

  @override
  Widget build(BuildContext context) {
    if(bInit == false) {
      _bSelected = widget.bSelected;
      bInit = false;
    }

    return ChoiceChip(label: Text(widget.strText),
      autofocus: widget.bAutoFocus,
      selected: _bSelected,
      tooltip: '',
      onSelected: (bIsSelected) => {
        setState(() {
          _bSelected = !_bSelected;
        })
      },
    );
  }
}
