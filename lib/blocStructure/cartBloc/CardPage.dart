import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/AppUtils.dart';
import '../fireStoreBloc/storeBloc/FireStoreBloc.dart';
import '../fireStoreBloc/storeBloc/FireStoreEvent.dart';
import '../fireStoreBloc/storeBloc/FireStoreState.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late FireStoreBloc fireStoreBloc;
  num cartTotal = 0;
  @override
  void initState() {
    fireStoreBloc = FireStoreBloc();
    fireStoreBloc.add(CartItemLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
      ),
      body: BlocBuilder<FireStoreBloc, FireStoreState>(
        bloc: fireStoreBloc,
        builder: (context, state) {
          if (state is CartItemLoadingState) {
            return Container();
          } else if (state is CartItemFetchState) {
            //return Text('${state.itemCartList.length}');
            return CartItemWidget(state: state);
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<FireStoreBloc, FireStoreState>(
        builder: (context, state) {
          print('Build Bottom $state');
          if (state is CartItemLoadingState) {
            print('CartItemLoadingState $state');
            return Container();
          } else if (state is CartItemFetchState) {
            print('CartItemFetchState $state');
            return Container(
              alignment: Alignment.center,
              height: 60,
              child: Text(state.cartTotal.toString()),
            );
          }
          return Container(
            height: 0,
          );
        },
      ),
    );
  }

  Center buildLoadingWidget() => const Center(child: CircularProgressIndicator());

  Center buildErrorWidget(FireStoreErrorState state) =>
      Center(child: Text(state.error));
}

class CartItemWidget extends StatelessWidget {
  CartItemFetchState? state;
  CartItemWidget({
    this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: state!.itemCartList.length, //cartList!.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: state!.itemCartList[index],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      state!.itemCartList[index].imageUrl,
                      width: 100,
                      height: 200,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state!.itemCartList[index].name,
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
                              Constants.formatCurrency.format(state!.itemCartList[index].price),
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(width: 20.0),
                            Text(
                              Constants.formatCurrency.format(state!.itemCartList[index].sellPrice),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state!.itemCartList[index].description,
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
          );
        });
  }
}
