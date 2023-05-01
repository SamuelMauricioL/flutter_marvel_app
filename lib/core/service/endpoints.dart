class Endpoints {
  static const String baseUrl =
      "https://gateway.marvel.com:443/v1/public/characters";
  static const String apiKey = "apikey=fea4ddbf370376865724c2b03db5ffef";
  static const String hash = "hash=c3de3454e8dc6486f0e30e8f937745fe";
  static const String ts = "ts=1677784856";

  /// Full endpoints
  static String getHeroes() => '$baseUrl?$apiKey&$hash&$ts&limit=11';
  static String getComics(String characterId) =>
      '$baseUrl/$characterId/comics?$apiKey&$hash&$ts';
  static String getEvents(String characterId) =>
      '$baseUrl/$characterId/events?$apiKey&$hash&$ts';
  static String getSeries(String characterId) =>
      '$baseUrl/$characterId/series?$apiKey&$hash&$ts';
  static String getStories(String characterId) =>
      '$baseUrl/$characterId/stories?$apiKey&$hash&$ts';
}
