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
  bool _showAppbar = false;

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
        title: Visibility(
          visible: _showAppbar,
          child: Text('How to Design a Home That’s Warm & Welcoming? ',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                wordSpacing: 1,
                color: Colors.black,
              )),
        ),
        leading: IconButton(
          icon: new Icon(
            Icons.close,
            color: Color(0xff26273D),
          ),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        actions: <Widget>[
          Visibility(
            visible: _showAppbar,
            child: Row(children: [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Image(
                  height: 18,
                  image: AssetImage("assets/images/thumb_up.png"),
                ),),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Image(
                  height: 18,
                  image: AssetImage("assets/images/share.png"),
                ),),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Image(
                  height: 18,
                  image: AssetImage("assets/images/bookmark_border.png"),
                ),),
            ]),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        cornerRadiusOnFullscreen: 0.0,
        closeOnBackButtonPressed: true,
        snapSpec: SnapSpec(
          snap: true,
          snappings: [0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
          onSnap: (state, snap) {
            // print('Snapped to $snap $state');
            setState(() {
              _showAppbar = state.isExpanded;
            });
          },
        ),
        body: Column(children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 3.4,
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              fit: BoxFit.fill);
                        }),
                  ),
                ]),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
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
              Visibility(
                visible: !_showAppbar,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Text('How to Design a Home That’s Warm & Welcoming? ',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 1,
                            )),
                        SizedBox(height: 16),
                        Row(children: [
                          Text(
                            '\$9,400',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Image(
                            height: 14,
                            image: AssetImage("assets/images/info.png"),
                          )
                        ]),
                        SizedBox(height: 16),
                        Row(children: [
                          Row(children: [
                            Image(
                              height: 18,
                              image: AssetImage("assets/images/thumb_up.png"),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '77 Likes',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0Xff676777),
                                  ),
                                )),
                          ]),
                          SizedBox(width: 16),
                          Row(children: [
                            Image(
                              height: 18,
                              image: AssetImage("assets/images/share.png"),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '13 Shares',
                                  style: TextStyle(
                                    fontSize: 14,
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
                      ]),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'This 3 room resale flat at Veerasamy road will floor you with the smart design and intelligent use of space.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0Xff26273D),
                            fontStyle: FontStyle.italic,
                            wordSpacing: 5,
                          )),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: chipList(),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'View All',
                        style: TextStyle(
                            color: Color(0Xff3655F2),
                            wordSpacing: 2,
                            fontSize: 16),
                      ),
                      new Divider(
                        color: Color(0xffF4F4F5),
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'A carefully  designed home experience',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Gilroy',
                            color: Color(0Xff26273D),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                          'For Yvonne Yeo, a home is where one can relax, entertain and work at ease and comfort. Coming from an interior design background, she knew the sort of details she needed to get into while renovating her own home. Also, she had to make sure that her house gives her a sense of security and calm since she lives by herself. We love the quirky corners in her HDB and we are sure you will love them too!'
                              'Check out how Wanting Liu helped her through the process of designing and gave her the home that she dreamt of! Check out how Wanting Liu helped her through the process of designing and gave her the home that she dreamt of! Check out how Wanting Liu helped her through the process of designing and gave her the home that she dreamt of!'
                          'For Yvonne Yeo, a home is where one can relax, entertain and work at ease and comfort. Coming from an interior design background, she knew the sort of details she needed to get into while renovating her own home. Also, she had to make sure that her house gives her a sense of security and calm since she lives by herself. We love the quirky corners in her HDB and we are sure you will love them too!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0Xff26273D),
                            wordSpacing: 2,
                          )),
                      SizedBox(height: 16),
                    ]),
              ),
            ]),
          );
        },
      ),
    );
  }

  chipList() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
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
      height: 24,
      child: Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        label: Text(
          label,
          style: TextStyle(
            color: Color(0Xff676777),
            fontSize: 12,
            height: -0.1,
          ),
          textAlign: TextAlign.center,
        ),
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0Xff676777), width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
