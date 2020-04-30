import 'package:covid_19/app/app_module.dart';
import 'package:covid_19/app/modules/home/models/covid.dart';
import 'package:covid_19/app/modules/home/repositories/covid_repository.dart';
import 'package:covid_19/app/modules/home/repositories/interfaces/covid_repository_interface.dart';
import 'package:covid_19/app/shared/helpers/interfaces/api_helper_interface.dart';
import 'package:dio/dio.dart';
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

  //
  setUp(() {
    repositoryMock = Modular.get<ICovidRepository>();
    homeController = Modular.get();
  });

  group('HomeController Test', () {
    test("First Test", () async {
      final defaultCovid = Covid(
        country: "Brazil",
        cases: 16026,
        confirmed: 40743,
        deaths: 2587,
        recovered: 22130,
        updatedAt: DateTime.parse("2020-04-21T00:30:31.000Z"),
      );

      mockito
          .when(repositoryMock.getByCountry())
          .thenAnswer((_) async => defaultCovid);

      homeController.fetch();
      await asyncWhen((_) => homeController.covid.value != null, timeout: 5);

      expect(homeController.covid.value, equals(defaultCovid));
    });
  });
}
