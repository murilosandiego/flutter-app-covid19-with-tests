import '../../shared/constants/app_constants.dart';
import '../models/covid.dart';
import '../models/covid_state.dart';

abstract class ICovidRepository {
  Future<Covid> getByCountry(
      {String country = BRASIL, bool forceRefresh = false});
  Future<List<CovidState>> getByStates({bool forceRefresh = false});
}
