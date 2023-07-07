part of 'cubit.dart';

abstract class TopHeadlinesState extends Equatable {
  final List<News?>? data;
  final String? error;

  const TopHeadlinesState({this.data, this.error});

  @override
  List<Object?> get props => [
        data,
        error,
      ];
}

class TopHeadlinesLoading extends TopHeadlinesState {
  const TopHeadlinesLoading() : super();
}

class TopHeadlinesSuccess extends TopHeadlinesState {
  const TopHeadlinesSuccess({List<News?>? data}) : super(data: data);
}

class TopHeadlinesFailure extends TopHeadlinesState {
  const TopHeadlinesFailure(String message) : super(error: message);
}
