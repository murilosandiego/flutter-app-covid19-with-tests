import 'dart:convert';
import 'package:covid_19/app/shared/helpers/api_dio_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  final Dio tdio = Dio();
  DioAdapterMock dioAdapterMock;
  APIDioHelper tapi;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    tdio.httpClientAdapter = dioAdapterMock;
    tapi = APIDioHelper(dio: tdio);
  });

  group('Get method', () {
    test('should canbe used to get responses for any url', () async {
      final responsepayload = jsonEncode({"response_code": "1000"});
      final httpResponse = ResponseBody.fromString(
        responsepayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tapi.get("/any url");
      final expected = {"response_code": "1000"};

      expect(response, equals(expected));
    });

    test('should throw a new exception if erros occurs', () async {
      final responsepayload = jsonEncode(null);
      final httpResponse = ResponseBody.fromString(
        responsepayload,
        404,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      expect(tapi.get('/'), throwsException);
    });
  });

  group('Post Method', () {
    test('canbe used to get responses for any requests with body', () async {
      final responsepayload = jsonEncode({"response_code": "1000"});
      final httpResponse =
          ResponseBody.fromString(responsepayload, 200, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tapi.post("/any url", body: {"body": "body"});
      final expected = {"response_code": "1000"};

      expect(response, equals(expected));
    });

    test('should throw a new exception if erros occurs', () async {
      final responsepayload = jsonEncode(null);
      final httpResponse =
          ResponseBody.fromString(responsepayload, 401, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      expect(tapi.post('/any', body: {'body': 'body'}), throwsException);
    });
  });
}
