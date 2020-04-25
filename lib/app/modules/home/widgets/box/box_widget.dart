import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  final Color color;
  final Widget content;
  final String text;

  const BoxWidget({
    Key key,
    @required this.color,
    @required this.content,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 2.2),
          padding: EdgeInsets.only(left: 16),
          width: double.infinity,
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              content,
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.2,
              color: Color(0xFFDBE9F5),
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200],
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(1, 2),
              )
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 25,
          bottom: 40,
          child: Container(
            height: 20,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: color,
                ),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
