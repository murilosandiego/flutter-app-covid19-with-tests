import 'package:covid_19/app/modules/home/widgets/container/container_widget.dart';
import 'package:flutter/material.dart';

import '../../models/covid_state.dart';

class TableStatesWidget extends StatelessWidget {
  final List<CovidState> covidsStates;

  const TableStatesWidget({Key key, @required this.covidsStates})
      : assert(covidsStates != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(header: 'Casos por Estado', content: table);
  }

  Widget get table => SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: DataTable(
          horizontalMargin: 12,
          columnSpacing: 0,
          columns: [
            DataColumn(label: Text('Estado')),
            DataColumn(label: Text('Confirmados')),
            DataColumn(label: Text('Óbtos')),
            DataColumn(label: Text('Letalidade')),
          ],
          rows: datasRow,
        ),
      );

  List<DataRow> get datasRow => covidsStates.map<DataRow>((CovidState covid) {
        final letalidade =
            (covid.deaths / covid.cases * 100).toStringAsPrecision(2);
        return DataRow(
          cells: [
            DataCell(Text('${covid.state}')),
            DataCell(Text('${covid.cases}')),
            DataCell(Text('${covid.deaths}')),
            DataCell(Text('$letalidade%')),
          ],
        );
      }).toList();
}
