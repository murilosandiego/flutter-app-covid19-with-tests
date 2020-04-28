class ServerException implements Exception {
  final message;

  ServerException([this.message]);

  @override
  String toString() {
    if (message == null) return "ServerException";
    return "$message";
  }
}
