import 'package:covid_19/app/modules/home/models/covid_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'home_controller.dart';
import 'models/covid.dart';
import 'widgets/boxs/boxs_widget.dart';
import 'widgets/map/map_widget.dart';
import 'widgets/table_states/table_states_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          'Covid-19 | Brasil',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: () => controller.fetchAll(forceRefresh: true),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: _home(context),
    );
  }

  Widget _home(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.covidStates.value == null ||
            controller.covid.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<CovidState> covidsStates = controller.covidStates.value;
        Covid covid = controller.covid.value;

        final updatedAt =
            DateFormat('dd/MM/yyyy HH:mm').format(covid.updatedAt.toLocal());

        return RefreshIndicator(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Atualizado em: $updatedAt',
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 8),
                BoxsWidget(covid: covid),
                SizedBox(height: 16),
                TableStatesWidget(covidsStates: covidsStates),
                SizedBox(height: 16),
                MapWidget(covidsStates: covidsStates),
              ],
            ),
          ),
          onRefresh: () => controller.fetchAll(forceRefresh: true),
        );
      },
    );
  }
}
