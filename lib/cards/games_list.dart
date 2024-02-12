import 'package:flutter/material.dart';
import 'package:shoppingapp/PopUp%20Pages/GamePageScreen.dart';
import 'package:shoppingapp/cards/freegamesCover.dart';
import 'package:shoppingapp/cards/gameCard.dart';
import 'package:shoppingapp/cards/gamesCover.dart';
import 'package:shoppingapp/PopUp%20Pages/freeGamesPagescreen.dart';
import 'package:shoppingapp/variables.dart';

class GamesList extends StatelessWidget {
  const GamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];
              return gameCard(
                gameInfos: product,
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 6.0),
                child: Text(
                  "Hottest Deals",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(229, 194, 3, 223),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 1.0),
                      child: Text(
                        "See Alllllll Deals ➨",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            itemCount: games.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final game = games[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return GamePageScreen(
                        games: game,
                      );
                    }),
                  );
                },
                child: GamesCover(games: game),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 6.0),
                child: Text(
                  "Top Free",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(229, 194, 3, 223),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 1.0),
                      child: Text(
                        "View All ➨",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            itemCount: games.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final freegame = Freegames[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return FreeGamePageScreen(
                        freegames: freegame,
                      );
                    }),
                  );
                },
                child: FreeGamesCove(
                  freegames: freegame,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
