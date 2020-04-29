import 'package:meta/meta.dart' show required;

abstract class IAPIHelper {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, {Map headers, @required body, encoding});
}
