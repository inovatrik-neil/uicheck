import 'package:flutter/material.dart';

class HeaderMain extends StatefulWidget {
  final String imgLogo;
  final String imgNotify;
  final String imgCart;
  final String txtHeader;
  final String txtSubHeader;

  const HeaderMain({
    Key? key,
    required this.imgLogo,
    required this.imgNotify,
    required this.imgCart,
    required this.txtHeader,
    required this.txtSubHeader,
  }) : super(key: key);

  @override
  _HeaderMainState createState() => _HeaderMainState();
}

class _HeaderMainState extends State<HeaderMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(widget.imgLogo),
                height: 38,
              ),
              const Spacer(),
              Image(
                image: AssetImage(widget.imgNotify),
                height: 22,
              ),
              SizedBox(width: 15),
              Image(
                image: AssetImage(widget.imgCart),
                height: 22,
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
                hintStyle: TextStyle(
                  color: Color(0xFF92939E),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            widget.txtHeader,
            style: TextStyle(
                fontSize: 28.0,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            widget.txtSubHeader,
            style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF676777)),
          ),
        ],
      ),
    );
  }
}
