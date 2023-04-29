class ServerResponse {

  ServerResponse({
    required this.isSuccess,
    this.message,
    this.result,
    required this.statusCode,
  });
  bool isSuccess;
  String? message;
  dynamic result;
  int statusCode;

  dynamic get response {
    return result;
  }
}