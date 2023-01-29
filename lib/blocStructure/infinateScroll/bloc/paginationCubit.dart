import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocStructure/infinateScroll/bloc/pagination_state.dart';

import '../model/post.dart';
import '../repo/postRepository.dart';

class PostCubit extends Cubit<PostPaginationState> {
  PostCubit(this.postRepository) : super(PaginationInitState());
  int page = 1;
  final PostRepository postRepository;

  void loadPost() {
    if (state is PostLoading) return;
    final currentState = state;
    var oldList = <Post>[];
    if (currentState is PostLoaded) {
      oldList = currentState.posts;
    }
    emit(PostLoading(oldList, isFirstFetch: page == 1));
    postRepository.fetchPost(page).then((newPost) {
      page++;
      final posts = (state as PostLoading).oldPost;
      posts.addAll(newPost);
      emit(PostLoaded(posts));
    });
  }
}
