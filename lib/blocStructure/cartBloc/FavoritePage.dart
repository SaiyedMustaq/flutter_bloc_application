import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocStructure/cartBloc/shopRepository/favoriteRepository.dart';

import '../fireStoreBloc/mdoel/ItemModel.dart';
import '../fireStoreBloc/storeBloc/FireStoreBloc.dart';
import '../fireStoreBloc/storeBloc/FireStoreEvent.dart';
import '../fireStoreBloc/storeBloc/FireStoreState.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FireStoreBloc? favoriteItemsBlocBloc;
  FavoriteRepository? favoriteRepository;

  @override
  void initState() {
    favoriteItemsBlocBloc = FireStoreBloc();
    favoriteRepository = FavoriteRepository();
    favoriteItemsBlocBloc!.add(FavoriteItemLoadingEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Page'),
          centerTitle: true,
        ),
        body: BlocBuilder<FireStoreBloc, FireStoreState>(
          bloc: favoriteItemsBlocBloc,
          builder: (context, state) {
            if (state is FireStoreItemsLoadingState) {
              return Container();
            }
            if (state is FireStoreItemFetchState) {
              //  return Center(child: Text('${state.fireStoreList.length}'));
              return checkoutListBuilder(
                  state.fireStoreList, favoriteItemsBlocBloc);
            }

            return const Center(
              child: Text('Data not found'),
            );
          },
        ));
  }
}

Widget checkoutListBuilder(
    List<ItemModel> cartItem, FireStoreBloc? favoriteItemsBlocBloc) {
  return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: cartItem.length, //cartList!.length,
      itemBuilder: (context, index) {
        return Container(
          child: Hero(
            tag: cartItem[index],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      cartItem[index].imageUrl,
                      width: 100,
                      height: 200,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem[index].name,
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              '${cartItem[index].price}',
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(width: 20.0),
                            Text(
                              '${cartItem[index].sellPrice}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          cartItem[index].description,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     state.fireStoreList[index].isFav
                    //         ? IconButton(
                    //             icon: Icon(
                    //               Icons.favorite,
                    //             ),
                    //             onPressed: () {
                    //               fireStoreBloc!.add(
                    //                 FavoriteItemRemoveEvent(
                    //                     docId: state.fireStoreList[index].id
                    //                         .toString(),
                    //                     value: false),
                    //               );
                    //             },
                    //             color: Colors.red,
                    //           )
                    //         : IconButton(
                    //             icon: Icon(
                    //               Icons.favorite_border,
                    //             ),
                    //             onPressed: () {
                    //               fireStoreBloc!.add(
                    //                 FavoriteItemAddEvent(
                    //                     cartModel:
                    //                         state.fireStoreList[index],
                    //                     docId: state.fireStoreList[index].id
                    //                         .toString(),
                    //                     value: true),
                    //               );
                    //             },
                    //           ),
                    //   ],
                    // )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
