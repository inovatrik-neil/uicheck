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
            SizedBox(height: 10),
            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Row(children: [
                        Text('Top Stories'),
                        const Spacer(),
                        Image(
                          image: AssetImage("assets/images/arrow_forward.png"),
                          height: 40,
                        )
                      ]))
                    ])),

            SizedBox(
              height: MediaQuery.of(context).size.height / 3.4,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/home_bg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.bottomLeft,
                          // This aligns the child of the container
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            //some spacing to the child from bottom
                            child: Text(
                              '3 things you do at\nliving room',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                wordSpacing: 2,
                              ),
                            ),
                          ),
                        ));
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
