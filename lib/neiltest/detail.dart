import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'Indicator.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon(
            Icons.close,
            color: Color(0xff26273D),
          ),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        backgroundColor: Colors.white,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        cornerRadiusOnFullscreen: 0.0,
        closeOnBackButtonPressed: true,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.4,
            child: Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          return Image(
                              image: AssetImage("assets/images/detail_top.png"),
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill);
                        }),
                  ),
                ]),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40),
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

        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('How to Design a Home That’s Warm & Welcoming? ',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 16),
                      Row(children: [
                        Text(
                          '\$9,400',
                          style: TextStyle(
                            fontSize: 16,
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
                      SizedBox(height: 20),
                      Row(children: [
                        Row(children: [
                          Image(
                            height: 20,
                            image: AssetImage("assets/images/thumb_up.png"),
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
                            height: 20,
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
                          image:
                              AssetImage("assets/images/bookmark_border.png"),
                          height: 18,
                        ),
                      ]),
                      SizedBox(height: 16),
                      Text(
                          'This 3 room resale flat at Veerasamy road will floor you with the smart design and intelligent use of space.',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0Xff26273D),
                              fontStyle: FontStyle.italic)),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: chipList(),
                      ),
                      SizedBox(height: 10),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'View All',
                            style: TextStyle(
                                color: Color(0Xff3655F2), fontSize: 14),
                          )),
                      SizedBox(height: 50),
                      Text(
                        'A carefully  designed home experience',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Gilroy',
                            color: Color(0Xff26273D),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                          'For Yvonne Yeo, a home is where one can relax, entertain and work at ease and comfort. Coming from an interior design background, she knew the sort of details she needed to get into while renovating her own home. Also, she had to make sure that her house gives her a sense of security and calm since she lives by herself. We love the quirky corners in her HDB and we are sure you will love them too!'
                          'Check out how Wanting Liu helped her through the process of designing and gave her the home that she dreamt of!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0Xff26273D),
                          )),
                      SizedBox(height: 16),
                    ]),
              )
            ]),
          );
        },
      ),
    );
  }

  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        chip('MODERN'),
        chip('CONTEMPORARY'),
        chip('RUSTIC'),
        chip('CLASSIC'),
        chip('RUSTIC'),
        chip('MINIMAL'),
        chip('MODERN'),
        chip('CLASSIC'),
      ],
    );
  }

  Widget chip(String label) {
    return SizedBox(
      height: 30,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: Color(0Xff676777), fontSize: 10),
          textAlign: TextAlign.center,
        ),
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0Xff676777), width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
