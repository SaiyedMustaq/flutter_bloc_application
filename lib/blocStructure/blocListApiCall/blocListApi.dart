import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/AppUtils.dart';
import 'AboutPage.dart';
import 'ArticleDetailPage.dart';
import 'bloc/ArticleBloc.dart';
import 'bloc/ArticleEvent.dart';
import 'bloc/ArticleState.dart';
import 'model/ApiResultModel.dart';

class BlocListingPage extends StatefulWidget {
  @override
  _BlocListingPageState createState() => _BlocListingPageState();
}

class _BlocListingPageState extends State<BlocListingPage> {
  ArticleBloc? articleBloc;

  @override
  void initState() {
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc!.add(FetchArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bloc Listing'),
      ),
      body: Container(
        child: BlocListener<ArticleBloc, ArticleState>(
          listener: (context, state) {
            if (state is ArticleErrorState) {
              Constants.commonMethod.showSnack(
                  context: context, message: state.message, actionText: '');
            }
          },
          child: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              if (state is ArticleInitialState) {
                return buildLoading(context);
              } else if (state is ArticleLoadingState) {
                return buildLoading(context);
              } else if (state is ArticleLoadedState) {
                return buildArticleList(state.articles, context);
              } else if (state is ArticleErrorState) {
                return buildErrorUi(state.message!);
              }
              return Container(
                child: Center(
                    child: Text(
                  'Something',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget buildLoading(BuildContext context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.blue.withOpacity(0.2),
      child: Center(child: CircularProgressIndicator()),
    ),
  );
}

Widget buildErrorUi(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}

Widget buildArticleList(List<Articles>? articles, BuildContext context) {
  return ListView.builder(
    itemCount: articles?.length,
    itemBuilder: (ctx, pos) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: ListTile(
            // leading: AppCircleAvatar(
            //   imageUrl: articles[pos].urlToImage,
            // ),
            title: Text(articles?[pos].title??""),
            subtitle: Text(articles?[pos].publishedAt??""),
          ),
          onTap: () {
            navigateToArticleDetailPage(context, articles![pos]);
          },
        ),
      );
    },
  );
}

// ignore: must_be_immutable
class AppCircleAvatar extends StatelessWidget {
  String? imageUrl;
  AppCircleAvatar({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipOval(
        child: Hero(
          tag: imageUrl!,
          child: Image.network(
            imageUrl!,
            errorBuilder: (context, error, stackTrace) {
              return CircleAvatar(
                maxRadius: 32.0,
                minRadius: 30.0,
                child: Icon(Icons.error_rounded),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                );
              }
            },
            fit: BoxFit.cover,
            height: 100.0,
            width: 70.0,
          ),
        ),
      ),
    );
  }
}

void navigateToArticleDetailPage(BuildContext context, Articles article) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ArticleDetailPage(
      article: article,
    );
  }));
}

void navigateToAoutPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return AboutPage();
  }));
}
