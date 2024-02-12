import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/LikedProvider.dart';

class FreeGamePageScreen extends StatefulWidget {
  final Map<String, String> freegames;

  const FreeGamePageScreen({Key? key, required this.freegames})
      : super(key: key);

  @override
  State<FreeGamePageScreen> createState() => _FreeGamePageScreenState();
}

class _FreeGamePageScreenState extends State<FreeGamePageScreen> {
  bool isPressed = false;
  void onTap() {
    Provider.of<LikedProvider>(context, listen: false).addProduct(
      {
        "id": widget.freegames['id'],
        "title": widget.freegames['title'],
        "text": widget.freegames['text'],
        "asset": widget.freegames['asset'],
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Game Is Added To The Liked :)",
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
                widget.freegames["asset"]!,
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
                        widget.freegames["title"]!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 226, 222, 222),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.freegames["text"]!,
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
                            isPressed
                                ? "Added To Liked Games"
                                : "Add To Liked Games",
                            style: TextStyle(
                              fontSize: 16,
                              color: isPressed
                                  ? const Color.fromARGB(255, 220, 114, 114)
                                  : const Color.fromARGB(255, 176, 170, 170),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.favorite,
                                size: 30,
                                color: isPressed
                                    ? const Color.fromARGB(255, 220, 114, 114)
                                    : const Color.fromARGB(255, 176, 170, 170),
                              ),
                              onPressed: onTap),
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
