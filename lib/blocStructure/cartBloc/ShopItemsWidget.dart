// import 'package:bloc_app/cartBloc/CartItemsBloc.dart';
// import 'package:flutter/material.dart';

// class ShopItemsWidget extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       initialData: bloc.allItems, // The bloc was already instantiated.
//       stream: bloc.getStream, // The stream we'll be listing to
//       builder: (context, snapshot) {
//         // snapshot contains the data of the bloc
//         //return Center(child: Text("All items in shop have been taken"));
//         return shopItemsListBuilder(snapshot);
//       },
//     );
//   }
// }

// Widget shopItemsListBuilder(snapshot) {
//   return ListView.builder(
//     itemCount: snapshot.data["shop_items"].length,
//     itemBuilder: (BuildContext context, i) {
//       final shopList = snapshot.data["shop_items"];
//       return ListTile(
//         title: Text(shopList[i]['name']),
//         subtitle: Text("\$${shopList[i]['price']}"),
//         trailing: IconButton(
//           icon: Icon(Icons.add_shopping_cart),
//           onPressed: () {
//             bloc.addToCartItem(shopList[i]);
//           },
//         ),
//         onTap: () {},
//       );
//     },
//   );
// }
