import 'package:ecomm_flutter/components/cart_item.dart';
import 'package:ecomm_flutter/model/cart.dart';
import 'package:ecomm_flutter/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    'My Cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
                        // get individual product
                        Product individualProduct = value.userCart[index];

                        // return the cart item
                        return CartItem(
                          product : individualProduct,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
