import 'package:equatable/equatable.dart';

import '../model/ApiResultModel.dart';

abstract class ArticleState extends Equatable {}

class ArticleInitialState extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoadingState extends ArticleState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ArticleLoadedState extends ArticleState {
  List<Articles>? articles;

  ArticleLoadedState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class ArticleErrorState extends ArticleState {
  String? message;

  ArticleErrorState({this.message});

  @override
  List<Object> get props => [message!];
}
