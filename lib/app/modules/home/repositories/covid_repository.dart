import '../../../shared/constants/api_constants.dart' as api;
import '../../../shared/constants/app_constants.dart';
import '../../../shared/helpers/api_dio_helper.dart';
import '../models/covid.dart';
import '../models/covid_state.dart';
import 'interfaces/covid_repository_interface.dart';

class CovidRepository implements ICovidRepository {
  final APIDioHelper _client;

  CovidRepository(this._client);

  Future<Covid> getByCountry(
      {String country = BRASIL, bool forceRefresh = false}) async {
    try {
      final response = await _client.get(
        '${api.GET_BY_COUNTRY}/$country',
      );

      Covid covid = Covid.fromMap(response['data']);
      return covid;
    } catch (e) {
      throw e;
    }
  }

  Future<List<CovidState>> getByStates({bool forceRefresh = false}) async {
    try {
      final response = await _client.get(
        '${api.GET_BY_COUNTRY}',
      );

      List<CovidState> covids =
          (response['data'] as List).map<CovidState>((json) {
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
