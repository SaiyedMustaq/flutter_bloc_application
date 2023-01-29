import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/comersApp/screens/views/productDetails.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../repos/model/product.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> listProduct = [];
  @override
  void initState() {
    super.initState();
    callApi();
  }

  callApi() async {
    //! https://fakestoreapi.com/products

    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    print('${productFromJson(response.body)}');

    listProduct.addAll(productFromJson(response.body));
    print('LIST PRODUCT $listProduct');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Page ${listProduct.length}'),
      ),
      body: ListView.builder(
          itemCount: listProduct.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(ProductDetails(
                  id: listProduct[index].id,
                  productTitle: listProduct[index].title,
                ));
              },
              child: Column(
                children: [
                  Image.network(
                    listProduct[index].image.toString(),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      minLeadingWidth: 50.0,
                      leading: Text(
                          listProduct[index].rating!.count.toString()),
                      title: Text('${listProduct[index].title}'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${listProduct[index].description}'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
            // return ListTile(
            //   minLeadingWidth: 50.0,
            //   leading: Image.network(listProduct[index].image.toString()),
            //   title: Text('${listProduct[index].title}'),
            // ); //;
          }),
    );
  }
}
