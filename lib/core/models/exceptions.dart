class PolygonException implements Exception {
  final Map<String, dynamic> result;

  PolygonException(this.result);

  String get message => result["message"];
}
