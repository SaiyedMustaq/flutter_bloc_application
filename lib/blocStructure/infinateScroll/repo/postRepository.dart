

import '../model/post.dart';
import '../postServices.dart';

class PostRepository {
  final PostServices postServices;
  PostRepository(this.postServices);
  Future<List<Post>> fetchPost(int page) async {
    final post = await postServices.fetchPosts(page);
    return post.map((e) => Post.fromJson(e)).toList();
  }
}
