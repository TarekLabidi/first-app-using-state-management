import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/CartProvider.dart';
import 'dart:ui';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          children: [
            Text(
              "Games Selected",
              style: TextStyle(
                fontFamily: "lato",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 93, 228, 98),
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: Color.fromARGB(255, 93, 228, 98),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 80, 130, 98),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(cartItem["asset"] as String),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 71, 70, 70),
                          title: const Center(
                            child: Text(
                              "Remove Game",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 209, 42, 30),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          content: const Text(
                            "Are You Sure You Want To Remove This Game From The Cart ?",
                            style: TextStyle(
                              fontFamily: AutofillHints.birthday,
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                subtitle: Text(
                  "Price : ${cartItem['price']}",
                  style: const TextStyle(color: Colors.green),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
