import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homes extends StatelessWidget {
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
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        height: 60,
                      ),
                      const Spacer(),
                      Image(
                        image: AssetImage(
                          "assets/images/notification.png",
                        ),
                        height: 40,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(
                        image: AssetImage("assets/images/cart.png"),
                        height: 40,
                      ),
                    ]),
                    Container(
                        height: 50,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.grey,
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              prefixIcon: Icon(Icons.search),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ))),
                    Text('Hi, Adrian',
                        style: TextStyle(
                          fontSize: 40,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Explore designs',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ]),
            ),
          ],
        )),
      ),
    );
  }
}
