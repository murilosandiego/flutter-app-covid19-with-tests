import 'package:covid_19/app/modules/home/repositories/covid_repository.dart';
import 'package:covid_19/app/shared/helpers/api_dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart' show required;

class APIDioHelperMock extends Mock implements APIDioHelper {
  final Dio dio;
  APIDioHelperMock({@required this.dio});
}

class CovidRepositoryMock extends Mock implements CovidRepository {}
