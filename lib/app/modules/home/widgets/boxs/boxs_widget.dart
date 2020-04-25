import 'package:flutter/material.dart';

import '../../models/covid.dart';
import '../box/box_widget.dart';

class BoxsWidget extends StatelessWidget {
  final Covid covid;

  const BoxsWidget({Key key, @required this.covid})
      : assert(covid != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      BoxWidget(
        color: Color(0xFF5D78FF),
        content: Text(
          '${covid.confirmed}',
          style: TextStyle(
            color: Color(0xFF5D78FF),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        text: 'Casos Confirmados',
      ),
      SizedBox(height: 12),
      BoxWidget(
        color: Color(0xFF1FBB87),
        content: Text(
          '${covid.recovered}',
          style: TextStyle(
            color: Color(0xFF1FBB87),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        text: 'Recuperados',
      ),
      SizedBox(height: 12),
      BoxWidget(
        color: Color(0xFFFAB822),
        content: Text(
          '${covid.deaths}',
          style: TextStyle(
            color: Color(0xFFFAB822),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        text: 'Óbitos',
      ),
      SizedBox(height: 12),
      BoxWidget(
        color: Color(0xFFF8397A),
        content: Text(
          '${(covid.deaths / covid.confirmed * 100).toStringAsPrecision(1)}%',
          style: TextStyle(
            color: Color(0xFFF8397A),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        text: 'Letalidade',
      )
    ]);
  }
}
