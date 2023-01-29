import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../shopBloc/shop_bloc.dart';
import '../shopBloc/shop_state.dart';
import '../shopModel/Shop.dart';

class shopProductPage extends StatefulWidget {
  const shopProductPage({Key? key}) : super(key: key);

  @override
  _shopProductPageState createState() => _shopProductPageState();
}

class _shopProductPageState extends State<shopProductPage> {
  List<ShopItem>? shopItemList;
  List<ShopItem> cartItemList = [];
  bool isDataLoading = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {
        if (state is ShopInitial) {
          isDataLoading = true;
        }
        if (state is ShopPageLoadingState) {
          EasyLoading.show();
          shopItemList = state.cartItem.shopItemList;
          cartItemList = state.shopDate.shopItemList;
          isDataLoading = false;
          EasyLoading.dismiss();
        }

        if (state is ItemDeletedState) {
          cartItemList = state.listShopItem;
        }
      },
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Bloc Shop'),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Text(cartItemList.length.toString()),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.6,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4, //shopItemList!.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                height: 240,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 30),
                                          blurRadius: 60,
                                          color: const Color(0xFF393939)
                                              .withOpacity(.1))
                                    ]),
                                child: Column(),
                              ),
                              // Positioned(
                              //     top: 0,
                              //     child: Image.asset(
                              //       'assert/shape1.png',
                              //       height: 150,
                              //     )),
                              Positioned(
                                  left: 50,
                                  top: 50,
                                  bottom: 50,
                                  right: 50,
                                  child: Image.network(
                                    shopItemList![index].imagUrl,
                                    height: 150,
                                  )),
                            ],
                          );
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
