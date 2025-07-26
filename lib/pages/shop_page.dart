import 'dart:convert';
import 'package:ecomm_flutter/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomm_flutter/model/product.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Product> products = [];
  bool isLoading = true;

  Future<void> fetchProducts() async {
    final url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      products = jsonData.map((e) => Product.fromJson(e)).toList();
    } else {
      // Handle error==
      print("Failed to fetch products");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void addProdToCart(Product prod) {
    Provider.of<Cart>(context, listen: false).addItemToCart(prod);

    // alert the user , shoe successfully added
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully added!'),
              content: Text('Check Your Cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              // search bar
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Search Bar", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),

              // message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  "Some carry it. Others carry a legacy.",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              //hot picks
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Hot Picks 🔥",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    Text("See all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Product list from API
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductTile(
                      product: product,
                      onTap: () => addProdToCart(product),
                    );
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
                child: Divider(color: Colors.white),
              ),
            ],
          );
  }
}
