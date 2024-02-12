import 'package:flutter/material.dart';
import 'package:shoppingapp/cards/games_list.dart';
import 'package:shoppingapp/pages/cartPage.dart';
import 'package:shoppingapp/pages/likedPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [GamesList(), LikedPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.gamepad_outlined,
            size: 30,
          ),
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
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colors.black,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            label: "",
            activeIcon: Icon(
              Icons.home,
              size: 30,
              color: Color.fromARGB(202, 168, 18, 201),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.white,
            ),
            label: "",
            activeIcon: Icon(
              Icons.favorite,
              size: 30,
              color: Color.fromARGB(255, 222, 107, 107),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.white,
            ),
            label: "",
            activeIcon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Color.fromARGB(255, 93, 228, 98),
            ),
          ),
        ],
      ),
    );
  }
}
