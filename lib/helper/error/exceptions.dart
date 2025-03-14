class ServerException implements Exception {
  final String errorMessage;
  ServerException(this.errorMessage);
  @override
  String toString() => errorMessage; // غير مفهوم
}
