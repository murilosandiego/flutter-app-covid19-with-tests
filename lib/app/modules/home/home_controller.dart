import 'package:mobx/mobx.dart';

import 'models/covid.dart';
import 'models/covid_state.dart';
import 'repositories/interfaces/covid_repository_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ICovidRepository _covidRepository;

  _HomeControllerBase(this._covidRepository);

  @observable
  ObservableFuture<Covid> covid;

  @observable
  ObservableFuture<List<CovidState>> covidStates;

  @action
  fetch({String country = 'brazil', forceRefresh = false}) async {
    covid = _covidRepository
        .getByCountry(country: country, forceRefresh: forceRefresh)
        .asObservable();
  }

  @action
  fetchStates({forceRefresh = false}) async {
    covidStates =
        _covidRepository.getByStates(forceRefresh: forceRefresh).asObservable();
  }

  Future<void> fetchAll({forceRefresh: false}) {
    fetch(country: 'brazil', forceRefresh: true);
    fetchStates(forceRefresh: forceRefresh);
    return Future.delayed(Duration(microseconds: 100));
  }
}
