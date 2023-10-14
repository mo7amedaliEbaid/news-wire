part of 'cubit.dart';

class NewsDataProvider {
  static final dio = Dio();
  
  /// [apiKey] is required, you can get it from newsapi.org
  static final cache = Hive.box('newsBox');
  static final appCache = Hive.box('app');

  static Future<List<News>> fetchApi(String category) async {
    //cache.clear();
   // appCache.clear();
    try {

      final response = await dio.get(
      "https://newsapi.org/v2/top-headlines/sources",
        options: Options(
          headers: {
            'Authorization':apikey
          },
        ),
      );

      Map raw = response.data;
      log(raw.toString());

      List newsList = raw['sources'];
     // List newsList = raw['articles'];

      List<News> news = List.generate(
        newsList.length,
        (index) => News.fromMap(
          newsList[index],
        ),
      );

      await cache.put(category, news);
      await appCache.put('categoryTime', DateTime.now());

      return news;
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  static Future<List<News>?> fetchHive(String category) async {
    try {
      List? cachedNews = cache.get(category);

      if (cachedNews == null) return null;

      List<News>? news = List.generate(
        cachedNews.length,
        (index) => cachedNews[index],
      );
      return news;
    } catch (e) {
      log(e.toString());

      throw Exception(e.toString());
    }
  }
}
