import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/paginationCubit.dart';
import 'bloc/pagination_state.dart';
import 'model/post.dart';

class PostPage extends StatelessWidget {
  final scrollController = ScrollController();

  void setUpScroll(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PostCubit>(context).loadPost();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setUpScroll(context);
    BlocProvider.of<PostCubit>(context).loadPost();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bloc Pagination With Cubit"),
      ),
      body: _postList(),
    );
  }

  Widget _postList() {
    return BlocBuilder<PostCubit, PostPaginationState>(
        builder: (context, state) {
      if (state is PostLoading && state.isFirstFetch) {
        return _lodingIndicatore();
      }
      List<Post> posts = [];
      bool isLoading = false;
      if (state is PostLoading) {
        posts = state.oldPost;
        isLoading = true;
      } else if (state is PostLoaded) {
        posts = state.posts;
      }
      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < posts.length) {
            return _post(posts[index], context);
          } else {
            Timer(Duration(seconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _lodingIndicatore();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: posts.length + (isLoading ? 1 : 0),
      );
    });
  }
}

Widget _post(Post post, BuildContext context) {
  return Card(
    elevation: 5,
    child: Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              post.id.toString(),
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          SizedBox(height: 8),
          Text(
            post.title.toString().toUpperCase(),
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 8),
          Text(
            post.body.toString(),
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    ),
  );
}

Widget _lodingIndicatore() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: CircularProgressIndicator()),
  );
}
