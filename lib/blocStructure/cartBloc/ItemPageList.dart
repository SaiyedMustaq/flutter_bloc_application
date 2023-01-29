// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_app/cartBloc/CardPage.dart';

// import 'package:flutter_bloc_app/cartBloc/FavoritePage.dart';
// import 'package:flutter_bloc_app/cartBloc/PageListDetails.dart';

// import 'package:flutter_bloc_app/fireStoreBloc/storeBloc/FireStoreState.dart';
// import 'package:flutter_bloc_app/fireStoreBloc/storeBloc/FireStoreBloc.dart';

// import 'package:flutter_bloc_app/fireStoreBloc/mdoel/ItemModel.dart';
// import 'package:flutter_bloc_app/cartBloc/model/FlipCartModel.dart';
// import 'package:flutter_bloc_app/fireStoreBloc/storeBloc/FireStoreEvent.dart';
// import 'package:flutter_bloc_app/utils/AppUtils.dart';

// import 'checkout.dart';

// class ItemPageListPage extends StatefulWidget {
//   @override
//   _ItemPageListPageState createState() => _ItemPageListPageState();
// }

// class _ItemPageListPageState extends State<ItemPageListPage> {
//   FireStoreBloc? cartItemsBlocBloc;
//   List<FlipCartModel> listFlipcartModel = [];
//   late FirebaseFirestore firebaseFirestore;

//   @override
//   void initState() {
//     print('init');
//     firebaseFirestore = FirebaseFirestore.instance;
//     cartItemsBlocBloc = FireStoreBloc();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page List'),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => FavoritePage()));
//                     },
//                     icon: Icon(Icons.favorite)),
//                 IconButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => CardPage()));
//                     },
//                     icon: Icon(Icons.shopping_bag)),
//               ],
//             ),
//           )
//         ],
//       ),

//       //body: ShopItemsWidget(),
//       body: Card(
//         color: Colors.white,
//         elevation: 5.0,
//         shadowColor: Colors.black.withOpacity(1),
//         child: itemCart(
//           cartItemsBlocBloc: cartItemsBlocBloc,
//           cartList: ItemList,
//         ),
//       ),
//     );
//   }
// }

// class itemCart extends StatelessWidget {
//   FireStoreBloc? cartItemsBlocBloc;
//   List<ItemModel>? cartList;
//   itemCart({
//     Key? key,
//     this.cartItemsBlocBloc,
//     this.cartList,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FireStoreBloc, FireStoreState>(
//       bloc: cartItemsBlocBloc,
//       builder: (context, state) {
//         return ListView.builder(
//             itemCount: cartList!.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               PageListDetails(cartModel: cartList![index],
//                               fireStoreBloc: cartItemsBlocBloc,),));
//                 },
//                 child: Hero(
//                   tag: cartList![index],
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 5, top: 10, bottom: 10),
//                         height: 150,
//                         child: Image.network(
//                           cartList![index].imageUrl,
//                           width: 150,
//                           scale: 1.2,
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${cartList![index].name}',
//                             style: TextStyle(fontSize: 15.0),
//                           ),
//                           Text(
//                             '${cartList![index].price}',
//                             style: TextStyle(fontSize: 18.0),
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 5, top: 5, bottom: 5),
//                         child: IconButton(
//                             onPressed: () {
//                               if (cartList![index].isCard) {
//                                 cartItemsBlocBloc!.add(FavoriteItemRemoveEvent(
//                                     cartModel: cartList![index], docId: int.parse(cartList![index].id)));
//                               } else {
//                                 // cartItemsBlocBloc!.add(FavoriteItemAddEvent(
//                                 //     cartList![index], index));
//                               }
//                             },
//                             icon: cartList![index].isCard
//                                 ? Icon(
//                                     Icons.favorite,
//                                     color: Colors.red,
//                                   )
//                                 : Icon(
//                                     Icons.favorite_border,
//                                     color: Colors.red,
//                                   )),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             });
//       },
//     );
//   }
// }

// Widget productWidget(
//     int index, ItemModel cartModel, FireStoreBloc? cartItemsBlocBloc) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       productImage(imageUrl: '${cartModel.imageUrl}'),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           productName(
//             name: '${cartModel.name}',
//           ),
//           SizedBox(height: 5),
//           productPrice(
//             price: '${cartModel.price}',
//           ),
//         ],
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
//             child: IconButton(
//                 onPressed: () {
//                   if (cartModel.isCard) {
//                     Constants().showTost(message: 'Item in cart');
//                   } else {
//                     // cartItemsBlocBloc!
//                     //     .add(FavoriteItemAddEvent(cartModel, index));
//                   }
//                 },
//                 icon: Icon(Icons.shopping_cart)),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
//             child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
//           ),
//         ],
//       )
//     ],
//   );
// }

// Widget productImage({required String imageUrl}) {
//   return Container(
//     height: 100,
//     width: 100,
//     child: Image.network('$imageUrl'),
//   );
// }

// Widget productName({required String name}) {
//   return Text(
//     '$name',
//     style: TextStyle(
//       fontSize: 20.0,
//     ),
//   );
// }

// Widget productPrice({required String price}) {
//   return Text(
//     '$price',
//     style: TextStyle(
//         fontSize: 20.0, color: Colors.green, fontWeight: FontWeight.bold),
//   );
// }
