part of 'cubit.dart';

class ArticlesRepository {
  Future<List<Article>> fetchApi(String keyword) =>
      ArticlesDataProvider.fetch(keyword);

  Future<List<Article>?> fetchHive(String keyword) =>
      ArticlesDataProvider.fetchHive(keyword);
}
