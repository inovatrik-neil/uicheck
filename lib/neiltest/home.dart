import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:uicheck/neiltest/Indicator.dart';
import 'package:uicheck/neiltest/common/headerMain.dart';
import 'package:uicheck/neiltest/detail.dart';

class Home extends StatefulWidget {
  static String routeHome = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderMain(
                imgLogo: "assets/images/logo.png",
                imgNotify: "assets/images/notification.png",
                imgCart: "assets/images/cart.png",
                txtHeader: 'Hi, Adrian',
                txtSubHeader: 'Explore designs, book services for your home',
              ), //container for the header
              SizedBox(height: 15),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Top Stories',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.bold),
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
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 170,
                              margin: EdgeInsets.only(right: 12),
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
                              child: Container(
                                width: double.infinity,
                                decoration: new BoxDecoration(
                                    gradient: new LinearGradient(
                                      end: const Alignment(0.0, -1),
                                      begin: const Alignment(0.0, 0.6),
                                      colors: <Color>[
                                        Colors.black,
                                        Colors.black12.withOpacity(0.0)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(14),
                                        bottomLeft: Radius.circular(14))),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  //some spacing to the child from bottom
                                  child: Text(
                                    '3 things you do at\nliving room',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      wordSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      Container(
                        height: 200,
                        child: Stack(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: PageView.builder(
                                        itemCount: 5,
                                        controller: _pageController,
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (value) {
                                          setState(() {
                                            currentIndex = value;
                                          });
                                        },
                                        itemBuilder: (context, index) {
                                          // contents of slider
                                          return GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Detail()),
                                            ),
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/images/detail_top.png"),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fit: BoxFit.fill),
                                          );
                                        }),
                                  ),
                                ]),
                            Positioned(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Color(0XCC26273D)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ...List.generate(
                                        5,
                                        (index) {
                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Indicator(
                                                positionIndex: index,
                                                currentIndex: currentIndex,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'How to Design a Home That’s Warm & Welcoming? ',
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 16,
                                    color: Color(0xFF26273D),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 12),
                            Row(children: [
                              Text(
                                '\$9,400',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image(
                                height: 16,
                                image: AssetImage("assets/images/info.png"),
                              )
                            ]),
                            SizedBox(height: 16),
                            Row(children: [
                              Row(children: [
                                Image(
                                  height: 16,
                                  image:
                                      AssetImage("assets/images/thumb_up.png"),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '77 Likes',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0Xff676777),
                                      ),
                                    )),
                              ]),
                              SizedBox(width: 16),
                              Row(children: [
                                Image(
                                  height: 16,
                                  image: AssetImage("assets/images/share.png"),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '13 Shares',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0Xff676777),
                                      ),
                                    )),
                              ]),
                              const Spacer(),
                              Image(
                                image: AssetImage(
                                    "assets/images/bookmark_border.png"),
                                height: 18,
                              ),
                            ]),
                          ]),
                    )
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
