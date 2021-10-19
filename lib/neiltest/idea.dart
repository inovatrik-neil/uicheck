import 'package:flutter/material.dart';
import 'package:uicheck/neiltest/common/headerMain.dart';

class Idea extends StatefulWidget {
  const Idea({Key? key}) : super(key: key);

  @override
  _IdeaState createState() => _IdeaState();
}

class _IdeaState extends State<Idea> {
  List<String> _options = [
    'Sort',
    'Room',
    'Style',
    'Size',
    'Color',
    'Eco-friendly'
  ];
  List<bool> _selected = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderMain(
                imgLogo: "assets/images/logo.png",
                imgNotify: "assets/images/notification.png",
                imgCart: "assets/images/cart.png",
                txtHeader: 'Design Ideas',
                txtSubHeader: 'Explore designs, book services for your home',
              ), //container for the header
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 24),
                      child: Container(
                        height: 40,
                        child: _buildChips(),
                      ),
                    ),
                    // SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: _selected[i],
        labelPadding: EdgeInsets.only(left: 10, right: 10),
        label: Text(_options[i],
            style: TextStyle(
                color: Color(0xFF26273D),
                fontSize: 12,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
                letterSpacing: 1)),
        pressElevation: 5,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFFc7c7cb), width: 1),
          borderRadius: BorderRadius.circular(100),
        ),
        onSelected: (bool selected) {
          setState(() {
            _selected[i] = selected;
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.only(right: 10), child: filterChip));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }
}
