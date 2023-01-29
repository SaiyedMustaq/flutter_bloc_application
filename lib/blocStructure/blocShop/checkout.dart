import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../fireStoreBloc/mdoel/ItemModel.dart';
import '../fireStoreBloc/storeBloc/FireStoreBloc.dart';
import '../fireStoreBloc/storeBloc/FireStoreState.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  FireStoreBloc? cartItemsBlocBloc;

  @override
  void initState() {
    cartItemsBlocBloc = FireStoreBloc();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Center(
                child: ClipOval(
                  child: Text(
                    favoriteItem.length.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<FireStoreBloc, FireStoreState>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading:
                        Image.network(favoriteItem[index].imageUrl.toString()),
                    isThreeLine: true,
                    title: Text(favoriteItem[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        // cartItemsBlocBloc!.add(FavoriteItemRemoveEvent(
                        //     favoriteItem[index], index));
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 20.0,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Text('${favoriteItem[index].price}',
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600)),
                  ),
                );
              },
              itemCount: favoriteItem.length,
            );
          },
        )

        // StreamBuilder(
        //     stream: bloc.getStream,
        //     initialData: bloc.allItems,
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return Column(
        //           children: <Widget>[
        //             Expanded(child: checkoutListBuilder(snapshot)),
        //             RaisedButton(
        //               onPressed: () {},
        //               child: Text("Checkout"),
        //               color: Theme.of(context).primaryColor,
        //             ),
        //             SizedBox(height: 40)
        //           ],
        //         );
        //       } else {
        //         return Center(child: Text("You haven't taken any item yet"));
        //       }
        //     }),
        );
  }
}
