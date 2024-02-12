import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/CartProvider.dart';

class GamePageScreen extends StatefulWidget {
  final Map<String, String> games;

  const GamePageScreen({
    Key? key,
    required this.games,
  }) : super(key: key);

  @override
  State<GamePageScreen> createState() => _GamePageScreenState();
}

class _GamePageScreenState extends State<GamePageScreen> {
  bool isPressed = false;
  void onTap() {
    Provider.of<CartProvider>(context, listen: false).addProduct(
      {
        "id": widget.games['id'],
        "title": widget.games['title'],
        "price": widget.games['price'],
        "text": widget.games['text'],
        "asset": widget.games['asset'],
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Game Is Added To The Cart :)",
        ),
      ),
    );
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Game Informations",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 1),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/gaming.jpg"),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                widget.games['asset']!,
                width: 330,
                height: 440,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 88, 87, 87),
                      Color.fromARGB(255, 51, 50, 50),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                height: 300 - 37 - 19.57 - 0.00143,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.games['title']!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 226, 222, 222),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.games['text']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 169, 165, 165),
                          fontWeight: FontWeight.w300,
                          fontFamily: "Lato",
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "price : ${widget.games['price']!}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 7, 175, 69),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            isPressed ? "Added To Cart" : "Add To Cart",
                            style: TextStyle(
                              fontSize: 16,
                              color: isPressed
                                  ? const Color.fromARGB(255, 7, 175, 69)
                                  : const Color.fromARGB(255, 176, 170, 170),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: isPressed
                                  ? const Color.fromARGB(255, 7, 175, 69)
                                  : const Color.fromARGB(255, 176, 170, 170),
                            ),
                            onPressed: isPressed ? null : onTap,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
