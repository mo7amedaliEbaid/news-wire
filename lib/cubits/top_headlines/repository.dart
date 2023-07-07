part of 'cubit.dart';

class NewsRepository {
  Future<List<News>> fetchApi(String category,String countrycode,String language) =>
      NewsDataProvider.fetchApi(category,countrycode,language);

  Future<List<News>?> fetchHive(String category) =>
      NewsDataProvider.fetchHive(category);
}
