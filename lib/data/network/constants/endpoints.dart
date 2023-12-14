class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://api.openai.com/v1";

  // receiveTimeout
  static const int receiveTimeout = 60000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  static const String chat = baseUrl + '/chat/completions';
}
