import 'package:equatable/equatable.dart';

import '../model/post.dart';

abstract class PostPaginationState extends Equatable {
  const PostPaginationState();
}

class PaginationInitState extends PostPaginationState {
  @override
  List<Object?> get props => [];
}

class PostLoaded extends PostPaginationState {
  final List<Post> posts;
  PostLoaded(this.posts);
  @override
  List<Object?> get props => [];
}

class PostLoading extends PostPaginationState {
  final List<Post> oldPost;
  final bool isFirstFetch;
  const PostLoading(this.oldPost, {this.isFirstFetch = false});
  @override
  List<Object?> get props => [];
}
