part of 'cubit.dart';

@immutable
class ArticlesState extends Equatable {
  final List<Article>? data;
  final String? message;

  const ArticlesState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class ArticlesDefault extends ArticlesState {}

@immutable
class ArticlesFetchLoading extends ArticlesState {
  const ArticlesFetchLoading() : super();
}

@immutable
class ArticlesFetchSuccess extends ArticlesState {
  const ArticlesFetchSuccess({List<Article>? data}) : super(data: data);
}

@immutable
class ArticlesFetchFailed extends ArticlesState {
  const ArticlesFetchFailed({String? message}) : super(message: message);
}
