class Endpoints {
  static const String baseUrl =
      "https://gateway.marvel.com:443/v1/public/characters";

  /// Full endpoints
  static String getHeroes() => baseUrl;
  static String getComics(String characterId) => '$baseUrl/$characterId/comics';
  static String getEvents(String characterId) => '$baseUrl/$characterId/events';
  static String getSeries(String characterId) => '$baseUrl/$characterId/series';
  static String getStories(String characterId) =>
      '$baseUrl/$characterId/stories';
}
