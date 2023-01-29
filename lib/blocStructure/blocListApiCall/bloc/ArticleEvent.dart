abstract class ArticleEvent {}

class FetchArticlesEvent extends ArticleEvent {
  // ignore: null_check_always_fails
  List<Object> get props => null!;
}
