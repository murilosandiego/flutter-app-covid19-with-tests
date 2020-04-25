import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String header;
  final Widget content;

  const ContainerWidget({
    Key key,
    @required this.header,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(18),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.2,
              color: Color(0xFFDBE9F5),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Text(
            header,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            height: 428,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.2,
                color: Color(0xFFDBE9F5),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(1, 2),
                )
              ],
            ),
            child: content),
      ],
    );
  }
}
