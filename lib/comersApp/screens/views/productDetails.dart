import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../../repos/model/product.dart';

class ProductDetails extends StatefulWidget {
  final int? id;
  final String? productTitle;
  ProductDetails({Key? key, this.id, this.productTitle}) : super(key: key);
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Product product = Product();
  @override
  void initState() {
    super.initState();
    productLoad();
  }

  productLoad() async {
    EasyLoading.show(status: '', maskType: EasyLoadingMaskType.black);

    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/${widget.id}'));

    product = Product.fromJson(jsonDecode(response.body));
    EasyLoading.dismiss();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.productTitle}'),
      ),
      body: Column(
        children: [
          Image.network(
            product.image.toString(),
          )
        ],
      ),
    );
  }
}
