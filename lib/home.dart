import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicheck/detail.dart';

class Home extends StatelessWidget {
  static String routeHome = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage("assets/images/logo.png"),
                          height: 32,
                        ),
                        const Spacer(),
                        Image(
                          image: AssetImage("assets/images/notification.png"),
                          height: 24,
                        ),
                        SizedBox(width: 15),
                        Image(
                          image: AssetImage("assets/images/cart.png"),
                          height: 24,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color(0xffF4F4F5),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What are you looking for?',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Hi, Adrian",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: 'Gilroy',
                      ),
                    ),
                    Text(
                      "Explore designs, book services for your home",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromARGB(255, 103, 103, 103)),
                    ),
                  ],
                ),
              ), //container for the header
              SizedBox(height: 15),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Top Stories',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Gilroy',
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Detail()),
                          ),
                          child: Image(
                            image:
                                AssetImage("assets/images/arrow_forward.png"),
                            height: 24.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 250.0,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 160,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/home_bg.png"),
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(1.0),
                                      BlendMode.dstIn),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              // This aligns the child of the container
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                //some spacing to the child from bottom
                                child: Text(
                                  '3 things you do at\nliving room',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
