import 'package:covid_19/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../shared/constants/api_constants.dart' as api;
import '../../shared/constants/app_constants.dart';
import '../models/covid.dart';
import '../models/covid_state.dart';
import '../services/custom_dio_service.dart';

class CovidRepository implements ICovidRepository {
  final CustomDioService client;

  CovidRepository(this.client);

  Future<Covid> getByCountry(
      {String country = BRASIL, bool forceRefresh = false}) async {
    try {
      Response response = await client.http.get(
        '${api.GET_BASE}/$country',
        options:
            buildCacheOptions(Duration(hours: 1), forceRefresh: forceRefresh),
      );

      Covid covid = Covid.fromMap(response.data['data']);
      return covid;
    } catch (e) {
      throw e;
    }
  }

  Future<List<CovidState>> getByStates({bool forceRefresh = false}) async {
    try {
      Response response = await client.http.get(
        '${api.GET_BASE}',
        options:
            buildCacheOptions(Duration(hours: 1), forceRefresh: forceRefresh),
      );

      List<CovidState> covids =
          (response.data['data'] as List).map<CovidState>((json) {
        final CovidState covid = CovidState.fromMap(json);
        covid.lat = LATLNG_BR_STATES[covid.uf].first;
        covid.log = LATLNG_BR_STATES[covid.uf].last;
        return covid;
      }).toList();
      return covids;
    } catch (e) {
      throw e;
    }
  }
}
