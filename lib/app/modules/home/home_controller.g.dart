// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$covidAtom = Atom(name: '_HomeControllerBase.covid');

  @override
  ObservableFuture<Covid> get covid {
    _$covidAtom.context.enforceReadPolicy(_$covidAtom);
    _$covidAtom.reportObserved();
    return super.covid;
  }

  @override
  set covid(ObservableFuture<Covid> value) {
    _$covidAtom.context.conditionallyRunInAction(() {
      super.covid = value;
      _$covidAtom.reportChanged();
    }, _$covidAtom, name: '${_$covidAtom.name}_set');
  }

  final _$covidStatesAtom = Atom(name: '_HomeControllerBase.covidStates');

  @override
  ObservableFuture<List<CovidState>> get covidStates {
    _$covidStatesAtom.context.enforceReadPolicy(_$covidStatesAtom);
    _$covidStatesAtom.reportObserved();
    return super.covidStates;
  }

  @override
  set covidStates(ObservableFuture<List<CovidState>> value) {
    _$covidStatesAtom.context.conditionallyRunInAction(() {
      super.covidStates = value;
      _$covidStatesAtom.reportChanged();
    }, _$covidStatesAtom, name: '${_$covidStatesAtom.name}_set');
  }

  final _$fetchAsyncAction = AsyncAction('fetch');

  @override
  Future fetch({String country = 'brazil', dynamic forceRefresh = false}) {
    return _$fetchAsyncAction
        .run(() => super.fetch(country: country, forceRefresh: forceRefresh));
  }

  final _$fetchStatesAsyncAction = AsyncAction('fetchStates');

  @override
  Future fetchStates({dynamic forceRefresh = false}) {
    return _$fetchStatesAsyncAction
        .run(() => super.fetchStates(forceRefresh: forceRefresh));
  }

  @override
  String toString() {
    final string =
        'covid: ${covid.toString()},covidStates: ${covidStates.toString()}';
    return '{$string}';
  }
}
