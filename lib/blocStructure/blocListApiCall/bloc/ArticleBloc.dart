import 'package:bloc/bloc.dart';
import '../model/ApiResultModel.dart';
import '../repository/ArticleRepository.dart';
import 'ArticleEvent.dart';
import 'ArticleState.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleRepository? repository = ArticleRepository();

  ArticleBloc(ArticleState initialState) : super(initialState);
  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticlesEvent) {
      yield ArticleLoadingState();
      try {
        List<Articles> articles = await repository!.getArticles();
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }
}
