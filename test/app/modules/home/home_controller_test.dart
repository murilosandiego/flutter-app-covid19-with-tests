import 'package:covid_19/app/modules/home/models/covid.dart';
import 'package:covid_19/app/modules/home/models/covid_state.dart';
import 'package:covid_19/app/modules/home/repositories/interfaces/covid_repository_interface.dart';
import 'package:covid_19/app/shared/constants/app_constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:covid_19/app/modules/home/home_controller.dart';
import 'package:covid_19/app/modules/home/home_module.dart';
import 'package:mobx/mobx.dart';

import 'package:mockito/mockito.dart' as mockito;

import 'mocks.dart';

void main() {
  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => CovidRepositoryMock()),
  ]);

  CovidRepositoryMock repositoryMock;
  HomeController homeController;

  setUp(() {
    repositoryMock = Modular.get<ICovidRepository>();
    homeController = Modular.get<HomeController>();
  });

  group('HomeController', () {
    group('Covid observable', () {
      final defaultCovid = Covid(
        country: "Brazil",
        cases: 16026,
        confirmed: 40743,
        deaths: 2587,
        recovered: 22130,
        updatedAt: DateTime.parse("2020-04-21T00:30:31.000Z"),
      );

      test("should be assigned a value with success to the covid property",
          () async {
        mockito
            .when(repositoryMock.getByCountry())
            .thenAnswer((_) async => defaultCovid);

        homeController.fetch();
        await asyncWhen(
          (_) => homeController.covid.value != null,
          timeout: 5,
        );

        expect(homeController.covid.value, equals(defaultCovid));
      });
    });

    group('covidStates observable', () {
      test(
          'should be assigned a value with success to the covidStates property',
          () async {
        mockito
            .when(repositoryMock.getByStates())
            .thenAnswer((_) async => getDefaultCovidStatesList());

        homeController.fetchStates();
        await asyncWhen((_) => homeController.covidStates.value != null,
            timeout: 5);

        expect(homeController.covidStates.value, getDefaultCovidStatesList());
      });
    });
  });
}

getDefaultCovidStatesList() {
  const defaultResponse = {
    "data": [
      {
        "uid": 35,
        "uf": "SP",
        "state": "São Paulo",
        "cases": 21696,
        "deaths": 1825,
        "suspects": 5334,
        "refuses": 596,
        "datetime": "2020-04-27T20:34:15.110Z"
      },
      {
        "uid": 33,
        "uf": "RJ",
        "state": "Rio de Janeiro",
        "cases": 7944,
        "deaths": 677,
        "suspects": 1254,
        "refuses": 148,
        "datetime": "2020-04-27T20:34:15.110Z"
      },
    ],
  };

  final defautListCovid = defaultResponse['data'].map<CovidState>((item) {
    CovidState covid = CovidState.fromMap(item);
    covid.lat = LATLNG_BR_STATES[covid.uf].first;
    covid.log = LATLNG_BR_STATES[covid.uf].last;
    return covid;
  }).toList();

  return defautListCovid;
}
