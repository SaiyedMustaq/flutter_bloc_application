import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocStructure/cartBloc/shopBloc/shop_bloc.dart';
import 'package:flutter_bloc_application/blocStructure/cartBloc/shopBloc/shop_state.dart';


import '../../utils/AppUtils.dart';
import '../fireStoreBloc/mdoel/ItemModel.dart';
import '../fireStoreBloc/storeBloc/FireStoreBloc.dart';
import '../fireStoreBloc/storeBloc/FireStoreEvent.dart';
import '../fireStoreBloc/storeBloc/FireStoreState.dart';
import 'CardPage.dart';

class PageListDetails extends StatefulWidget {
  ItemModel? cartModel;
  FireStoreBloc? fireStoreBloc;
  PageListDetails({
    Key? key,
    required this.cartModel,
    required this.fireStoreBloc
  }) : super(key: key);

  @override
  _PageListDetailsState createState() => _PageListDetailsState();
}

class _PageListDetailsState extends State<PageListDetails> {
  ShopBloc? shopBloc;

  @override
  void initState() {
    super.initState();
    shopBloc = ShopBloc();
  }

  List<int> itemQty = [1, 2, 3];
  String dropdownValue = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cartModel!.name),
      ),
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<FireStoreBloc, FireStoreState>(
          builder: (context, state) {
            if (state is ItemAddSuccessState) {
              Constants.commonMethod.showSnack(context: context, message:'Item added successfully', actionText: '');
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: widget.cartModel!.imageUrl,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        widget.cartModel!.imageUrl,
                        height: 550,
                      ),
                    ),
                  ),
                  Text(
                    widget.cartModel!.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${widget.cartModel!.price}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialButton(
            height: 60,
            minWidth: MediaQuery.of(context).size.width / 2,
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CardPage()));
            },
            child: const Text('Goto cart',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                )),
          ),
          MaterialButton(
            height: 60,
            minWidth: MediaQuery.of(context).size.width / 2,
            color: Colors.orange,
            onPressed: () {
              widget.fireStoreBloc!.add(CartItemAddEvent(
                          value: false,
                          docId: widget.cartModel!.id.toString(),
                          cartModel: widget.cartModel
                        ));
            },
            child: const Text('Add To cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                )),
          )
        ],
      ),
    );
  }
}
