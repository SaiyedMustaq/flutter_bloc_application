// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../utils/AppUtils.dart';
// import '../cartBloc/FavoritePage.dart';
// import '../cartBloc/PageListDetails.dart';
// import 'mdoel/ItemModel.dart';
// import 'storeBloc/FireStoreBloc.dart';
// import 'storeBloc/FireStoreEvent.dart';
// import 'storeBloc/FireStoreState.dart';
//
// class FireStoreItemListPage extends StatefulWidget {
//   @override
//   _FireStoreItemListState createState() => _FireStoreItemListState();
// }
//
// class _FireStoreItemListState extends State<FireStoreItemListPage>
//     with TickerProviderStateMixin {
//   FireStoreBloc? fireStoreBloc;
//   FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
//   final String collection = 'flipecart';
//   final ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     fireStoreBloc = FireStoreBloc();
//     // getFireData();
//
//     scrollController.addListener(() {
//       if (scrollController.position.atEdge) {
//         if (scrollController.position.pixels != 0) {
//           //fireStoreBloc!.add(FireStoreItemsLoadingEvent());
//         }
//       }
//     });
//
//     loadData();
//     super.initState();
//   }
//
//   void loadData() async {
//     fireStoreBloc!.add(FireStoreItemsLoadingEvent());
//   }
//
//   Future getFireData() async {
//     firebaseFireStore.collection("$collection").get().then(
//       (querySnapshot) {
//         querySnapshot.docs.forEach((element) {
//           print('querySnapshot ===>> ${element.data()} ');
//           ItemList.add(ItemModel(
//               id: element.id,
//               isCard: element.data()['isCart'],
//               isFav: element.data()['isFav'],
//               name: element.data()['name'].toString().trim(),
//               description: element.data()['description'].toString().trim(),
//               imageUrl: element.data()['image'].toString().trim(),
//               off: element.data()['off'].toString().trim(),
//               price: element.data()['price'],
//               sellPrice: element.data()['sellprice']));
//         });
//       },
//     );
//     print('List Flip ${ItemList.length}');
//     fireStoreBloc!.add(FireStoreItemsLoadingEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       appBar: AppBar(
//         title: const Text('Page List'),
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
//       body: Card(
//         color: Theme.of(context).cardColor,
//         elevation: 5.0,
//         shadowColor: Colors.black.withOpacity(1),
//         child: BlocConsumer<FireStoreBloc, FireStoreState>(
//           listener: (context, state) {
//             if (state is CartGetTingListError) {
//               Constants.commonMethod.showSnack(
//                   context: context,
//                   message: '${state.errorMessage}',
//                   actionText: '');
//             }
//           },
//           builder: (context, state) {
//             return BlocBuilder<FireStoreBloc, FireStoreState>(
//               bloc: fireStoreBloc,
//               builder: (context, state) {
//                 if (state is FireStoreItemsLoadingState) {
//                   return Container();
//                 } else if (state is FireStoreItemFetchState) {
//                   return buildItemListWidget(
//                       state, fireStoreBloc, scrollController);
//                 } else if (state is FireStoreErrorState) {
//                   return buildErrorWidget(state);
//                 }
//                 return Container(
//                     child: Center(
//                   child: Text("No data found"),
//                 ));
//               },
//             );
//           },
//         ),
//         // child: itemCart(
//         //   cartItemsBlocBloc: fireStoreBloc,
//         // ),
//       ),
//     );
//   }
//
//   Center buildErrorWidget(FireStoreErrorState state) =>
//       Center(child: Text('${state.error}'));
//
//   ListView buildItemListWidget(FireStoreItemFetchState state,
//       FireStoreBloc? fireStoreBloc, ScrollController scrollController) {
//     return ListView.separated(
//       controller: scrollController,
//       shrinkWrap: true,
//       padding: EdgeInsets.all(10),
//       itemCount: state.fireStoreList.length, //cartList!.length,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PageListDetails(
//                   cartModel: state.fireStoreList[index],
//                   fireStoreBloc: fireStoreBloc,
//                 ),
//               ),
//             );
//           },
//           child: Card(
//             color: Theme.of(context).canvasColor,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).backgroundColor,
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               alignment: Alignment.center,
//               height: 400,
//               child: Hero(
//                 tag: state.fireStoreList[index],
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.network(
//                           state.fireStoreList[index].imageUrl,
//                           width: 200,
//                           height: 200,
//                         ),
//                         Column(
//                           children: [
//                             state.fireStoreList[index].isFav
//                                 ? IconButton(
//                                     icon: Icon(
//                                       Icons.favorite,
//                                     ),
//                                     //! REMOVE FAVORITE CALL
//                                     onPressed: () {
//                                       fireStoreBloc!.add(
//                                         FavoriteItemRemoveEvent(
//                                             docId: state.fireStoreList[index].id
//                                                 .toString(),
//                                             value: false,
//                                             index: index),
//                                       );
//                                     },
//                                     color: Colors.red,
//                                   )
//                                 : IconButton(
//                                     icon: Icon(
//                                       Icons.favorite_border,
//                                     ),
//                                     //! ADD FAVORITE
//                                     onPressed: () {
//                                       fireStoreBloc!.add(
//                                         FavoriteItemAddEvent(
//                                             cartModel:
//                                                 state.fireStoreList[index],
//                                             docId: state.fireStoreList[index].id
//                                                 .toString(),
//                                             value: true,
//                                             index: index),
//                                       );
//                                     },
//                                   ),
//                           ],
//                         )
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           '${state.fireStoreList[index].name}',
//                           style: Theme.of(context).textTheme.bodyText2,
//                           softWrap: true,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                         ),
//                         SizedBox(height: 20),
//                         Text(
//                           '${state.fireStoreList[index].description}',
//                           style: Theme.of(context).textTheme.bodyText1,
//                           maxLines: 2,
//                         ),
//                         SizedBox(height: 10),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         if (state.fireStoreList[index].price !=
//                             state.fireStoreList[index].sellPrice)
//                           Text(
//                             '${Constants.formatCurrency.format(state.fireStoreList[index].price)}',
//                             style: Theme.of(context).textTheme.bodyText1,
//                           ),
//                         SizedBox(width: 10.0),
//                         Text(
//                           '${Constants.formatCurrency.format(state.fireStoreList[index].sellPrice)}',
//                           style: Theme.of(context).textTheme.bodyText1,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 1,
//             color: Colors.black,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class itemCart extends StatelessWidget {
//   FireStoreBloc? cartItemsBlocBloc;
//   itemCart({
//     Key? key,
//     this.cartItemsBlocBloc,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // BlocProvider.of<FireStoreBloc>(context).add((FireStoreItemsLoadingEvent()));
//     return BlocBuilder<FireStoreBloc, FireStoreState>(
//       bloc: cartItemsBlocBloc,
//       builder: (context, state) {
//         if (state is FireStoreItemsLoadingState) {
//           return buildLoadingWidget();
//         } else if (state is FireStoreErrorState) {
//           return buildErrorWidget(state);
//         } else if (state is FireStoreItemFetchState) {
//           return buildItemListWidget(state);
//         }
//         return Center(
//           child: Container(),
//         );
//       },
//     );
//   }
//
//   Center buildLoadingWidget() => Center(child: CircularProgressIndicator());
//
//   Center buildErrorWidget(FireStoreErrorState state) =>
//       Center(child: Text('${state.error}'));
//
//   ListView buildItemListWidget(FireStoreItemFetchState state) {
//     return ListView.builder(
//         shrinkWrap: true,
//         padding: EdgeInsets.zero,
//         itemCount: state.fireStoreList.length, //cartList!.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PageListDetails(
//                     cartModel: state.fireStoreList[index],
//                     fireStoreBloc: cartItemsBlocBloc,
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               child: Hero(
//                 tag: state.fireStoreList[index],
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Image.network(
//                           state.fireStoreList[index].imageUrl,
//                           width: 100,
//                           height: 200,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '${state.fireStoreList[index].name}',
//                               style: TextStyle(
//                                   fontSize: 20.0, fontWeight: FontWeight.bold),
//                               softWrap: true,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 2,
//                             ),
//                             SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Text(
//                                   '${state.fireStoreList[index].price}',
//                                   style: TextStyle(
//                                       fontSize: 20.0,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.red,
//                                       decoration: TextDecoration.lineThrough),
//                                 ),
//                                 SizedBox(width: 20.0),
//                                 Text(
//                                   '${state.fireStoreList[index].sellPrice}',
//                                   style: TextStyle(
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               '${state.fireStoreList[index].description}',
//                               style: TextStyle(
//                                 fontSize: 15.0,
//                               ),
//                               maxLines: 2,
//                             ),
//                             SizedBox(height: 10),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             state.fireStoreList[index].isFav
//                                 ? IconButton(
//                                     icon: Icon(
//                                       Icons.favorite,
//                                     ),
//                                     onPressed: () {
//                                       cartItemsBlocBloc!.add(
//                                         FavoriteItemAddEvent(
//                                             cartModel:
//                                                 state.fireStoreList[index],
//                                             docId: state.fireStoreList[index].id
//                                                 .toString(),
//                                             value: false,
//                                             index: index),
//                                       );
//                                     },
//                                     color: Colors.red,
//                                   )
//                                 : IconButton(
//                                     icon: Icon(
//                                       Icons.favorite_border,
//                                     ),
//                                     onPressed: () {
//                                       cartItemsBlocBloc!.add(
//                                         FavoriteItemAddEvent(
//                                             cartModel:
//                                                 state.fireStoreList[index],
//                                             docId: state.fireStoreList[index].id
//                                                 .toString(),
//                                             value: true,
//                                             index: index),
//                                       );
//                                     },
//                                   ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
//
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
//
// Widget productImage({required String imageUrl}) {
//   return Container(
//     height: 100,
//     width: 100,
//     child: Image.network('$imageUrl'),
//   );
// }
//
// Widget productName({required String name}) {
//   return Text(
//     '$name',
//     style: TextStyle(
//       fontSize: 20.0,
//     ),
//   );
// }
//
// Widget productPrice({required String price}) {
//   return Text(
//     '$price',
//     style: TextStyle(
//         fontSize: 20.0, color: Colors.green, fontWeight: FontWeight.bold),
//   );
// }
