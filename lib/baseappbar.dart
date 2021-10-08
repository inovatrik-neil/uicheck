import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white10,
              boxShadow: [
                BoxShadow(
                  color: Colors.white10,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  alignment: Alignment.centerLeft,
                  icon:  Icon(Icons.arrow_back),
                  onPressed: () => {
                    if (Navigator.canPop(context)) {Navigator.pop(context)}
                  },
                ),
                //Place holder to add custom title
                Expanded(child: Container()),
                //You can add the other multiple icons need
              ],
            )));
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(50.0);
  }
}