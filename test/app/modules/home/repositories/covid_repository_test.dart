import 'package:covid_19/app/app_module.dart';
import 'package:covid_19/app/modules/home/home_module.dart';
import 'package:covid_19/app/modules/home/models/covid.dart';
import 'package:covid_19/app/modules/home/models/covid_state.dart';
import 'package:covid_19/app/shared/constants/api_constants.dart';
import 'package:covid_19/app/shared/constants/app_constants.dart';
import 'package:covid_19/app/shared/helpers/interfaces/api_helper_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:covid_19/app/modules/home/repositories/covid_repository.dart';

import '../mocks.dart';

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<IAPIHelper>((i) => APIDioHelperMock(dio: i.get())),
  ]);
  initModule(HomeModule());

  APIDioHelperMock client;
  CovidRepository repository;

  setUp(() {
    client = Modular.get<IAPIHelper>();
    repository = Modular.get<CovidRepository>();
  });

  group('CovidRepository', () {
    test("should have a instace of CovidRepository", () {
      expect(repository, isInstanceOf<CovidRepository>());
    });

    group('getByCountry method', () {
      const String DEFAULT_GET_URL = '$GET_BY_COUNTRY/$BRASIL';

      test('should return a Covid model', () async {
        const defaulResponse = {
          "data": {
            "country": "Brazil",
            "cases": 16026,
            "confirmed": 40743,
            "deaths": 2587,
            "recovered": 22130,
            "updated_at": "2020-04-21T00:30:31.000Z"
          }
        };
        final defaultCovid = Covid(
          country: "Brazil",
          cases: 16026,
          confirmed: 40743,
          deaths: 2587,
          recovered: 22130,
          updatedAt: DateTime.parse("2020-04-21T00:30:31.000Z"),
        );

        when(client.get(DEFAULT_GET_URL))
            .thenAnswer((_) async => defaulResponse);

        Covid dataResponse = await repository.getByCountry();
        expect(dataResponse, equals(defaultCovid));
      });

      test('should throw an ServerException when an erro occurs', () async {
        when(client.get(DEFAULT_GET_URL)).thenThrow(new Exception());
        expect(repository.getByCountry(), throwsException);
      });
    });

    group('getByStates method', () {
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
      test('should return a State list of State model', () async {
        when(client.get('$GET_BY_COUNTRY'))
            .thenAnswer((_) async => defaultResponse);

        final response = await repository.getByStates();
        expect(response, isA<List<CovidState>>());
        expect(response, equals(defautListCovid));
      });

      test('should throw an ServerException when an erro occurs', () async {
        when(client.get('$GET_BY_COUNTRY')).thenThrow(new Exception());
        expect(repository.getByStates(), throwsException);
      });
    });
  });
}
